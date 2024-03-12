//
//  AppStateViewModel.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 4/18/24.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage

class UserStateViewModel: ObservableObject {
    @Published var isSignedIn: Bool = false
    @Published var errorMessage: String? = nil
    @Published var currentUser: User?
    
    private let auth = Auth.auth()
    private let db = Database.database().reference()
    
    init() {
        isSignedIn = auth.currentUser != nil
        
        auth.addStateDidChangeListener { [weak self] (auth, user) in
            self?.isSignedIn = user != nil
            if let user = user {
                self?.fetchUserDetails(uid: user.uid)
            } else {
                self?.currentUser = nil
            }
        }
    }
    
    var currentUserEmail: String {
        if let user = auth.currentUser {
            user.email ?? "No email found"
        } else {
            "No user logged in"
        }
    }
    
    
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else{
                self.errorMessage = error?.localizedDescription
                return
            }
            // success
            print("Successfully Logged In")
            self.isSignedIn = true
        }
    }
    
    func signUp(email: String, password: String, confirmPassword: String) {
        if password != confirmPassword {
            self.errorMessage = "Both password should match"
            return
        }
        
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else{
                self.errorMessage = error?.localizedDescription
                return
            }
            // success
            print("Successfully Signed Up")
            self.isSignedIn = true
        }
    }
    
    private func fetchUserDetails(uid: String) {
        db.child("user").child(uid).observeSingleEvent(of: .value) { [weak self] snapshot, _ in
            guard let self = self else { return }

            if let value = snapshot.value as? [String: Any], !value.isEmpty {
                print("Fetched user details: \(value)")
                DispatchQueue.main.async {
                    self.currentUser = User(dictionary: value)
                    print("Current user updated: \(String(describing: self.currentUser))")
                }
            } else {
                print("User details are empty, creating with empty details for uid: \(uid)")
                self.createUserWithEmptyDetails(uid: uid)
            }
        }
    }

    
    private func createUserWithEmptyDetails(uid: String) {
        let emptyUserDetails = ["firstName": "", "lastName": "", "imageUrl": "", "email" : currentUserEmail, "favoriteMovies": []] as [String : Any]
        db.child("user").child(uid).setValue(emptyUserDetails) { [weak self] error, _ in
            if let error = error {
                print("Error creating user with empty details: \(error)")
                self?.errorMessage = "Unable to create user profile."
                return
            }
            self?.currentUser = User(dictionary: emptyUserDetails)
        }
    }
    
    func signOut() async {
        do {
            try auth.signOut()

            // Clear the locally stored data
            clearLocalData()

            // Update the published properties to reflect the new state
            DispatchQueue.main.async {
                self.isSignedIn = false
                self.currentUser = nil // Reset current user
                self.errorMessage = nil
            }

            print("Successfully Signed Out")
        }
        catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }

    private func clearLocalData() {
        // Reset all locally stored data, e.g., clearing user defaults, local files, etc.
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = urls[0]
        let fileURLs = try? fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)

        for fileURL in fileURLs ?? [] {
            try? fileManager.removeItem(at: fileURL)
        }
    }

}

extension UserStateViewModel {
    
    func updateUserDetails(firstName: String, lastName: String, imageData: Data?) {
        guard let currentUser = auth.currentUser else {
            self.errorMessage = "User not logged in"
            return
        }

        let uid = currentUser.uid

        if let imageData = imageData {
            let storageRef = Storage.storage().reference().child("profilePictures/\(uid)")
            storageRef.putData(imageData, metadata: nil) { metadata, error in
                guard metadata != nil else {
                    self.errorMessage = error?.localizedDescription ?? "Error uploading image"
                    return
                }
                
                storageRef.downloadURL { [weak self] url, error in
                    guard let downloadURL = url else {
                        self?.errorMessage = error?.localizedDescription ?? "Error getting image URL"
                        return
                    }
                    
                    self?.updateUserInDatabase(uid: uid, firstName: firstName, lastName: lastName, imageUrl: downloadURL.absoluteString)
                }
            }
        } else {
            updateUserInDatabase(uid: uid, firstName: firstName, lastName: lastName, imageUrl: self.currentUser?.imageUrl)
        }
    }

    private func updateUserInDatabase(uid: String, firstName: String, lastName: String, imageUrl: String?) {
        let userDetails = ["firstName": firstName, "lastName": lastName, "imageUrl": imageUrl ?? "", "email": currentUserEmail]
        
        db.child("user").child(uid).setValue(userDetails) { [weak self] error, _ in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else {
                self?.fetchUserDetails(uid: uid)  // Refetch or manually update local user data if needed
            }
        }
    }
}

extension UserStateViewModel {
    func addFavoriteMovie(movieId: String) {
        guard let uid = Auth.auth().currentUser?.uid else {
            errorMessage = "No user logged in"
            return
        }

        let userRef = db.child("user").child(uid)

        userRef.observeSingleEvent(of: .value) { [weak self] snapshot in
            guard let self = self else {
                self?.errorMessage = "Internal error."
                return
            }

            var userDict = snapshot.value as? [String: Any] ?? [:]  // Initialize userDict if nil
            var currentMovies = userDict["favoriteMovies"] as? [String] ?? []
            
            currentMovies.append(movieId)  // Add the new movie to the array
            let uniqueMovies = Array(Set(currentMovies))  // Remove duplicates

            userRef.updateChildValues(["favoriteMovies": uniqueMovies]) { error, _ in
                if let error = error {
                    self.errorMessage = "Error updating favorite movies: \(error.localizedDescription)"
                    return
                }
                self.currentUser?.favoriteMovies = uniqueMovies
                print("Favorite movie added")
                if let favoriteMovies = self.currentUser?.favoriteMovies {
                    print(favoriteMovies)
                } else {
                    print("No favorite movies found.")
                }
            }
        }
    }
    
    func deleteFavoriteMovie(movieId: String) {
            guard let uid = Auth.auth().currentUser?.uid else {
                errorMessage = "No user logged in"
                return
            }

            let userRef = db.child("user").child(uid).child("favoriteMovies")

            userRef.observeSingleEvent(of: .value) { [weak self] snapshot in
                var favoriteMovies = snapshot.value as? [String] ?? []

                if let index = favoriteMovies.firstIndex(of: movieId) {
                    favoriteMovies.remove(at: index)
                    userRef.setValue(favoriteMovies) { error, _ in
                        if let error = error {
                            self?.errorMessage = "Error updating favorite movies: \(error.localizedDescription)"
                            return
                        }
                        self?.currentUser?.favoriteMovies = favoriteMovies
                    }
                }
            }
        }
}




