//
//  JobCard.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 3/11/24.
//

import SwiftUI

struct JobCard:View {
    var job: Job
    var backgroundColor: Color = .purple
    
    var body: some View{
        NavigationLink {
            JobDetailsView(job: job)
        } label: {
            VStack(alignment: .leading, content: {
                HStack{
                    if let urlString = job.employerLogo, let url = URL(string: urlString) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .padding(6)
                                    .background(Color.white)
                                    .cornerRadius(10)
                            case .failure:
                                Image(systemName: "photo")
                                    .frame(width: 50, height: 50)
                                    .padding(6)
                                    .background(Color.white)
                                    .cornerRadius(10)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else {
                        Image(systemName: "photo")
                            .frame(width: 50, height: 50)
                    }
                    VStack(alignment: .leading, content: {
                        if let jobTitle = job.jobTitle {
                            Text(jobTitle)
                                .font(.subheadline.bold()).lineLimit(1)
                                .foregroundStyle(Color.white)
                        }
                        
                        if let employerName = job.employerName {
                            Text(employerName)
                                .font(.subheadline)
                                .foregroundStyle(Color.white)
                        }
                    })
                }
                Divider()
                HStack {
                    if let jobEmploymentType = job.jobEmploymentType {
                        Text(jobEmploymentType.uppercased())
                            .font(.caption)
                            .foregroundStyle(.black)
                            .bold()
                            .padding(5)
                            .background(.white.opacity(0.95))
                            .clipShape(Capsule())
                    }
                    Spacer()
                    if let jobMaxSalary = job.jobMaxSalary, let jobSalaryPeriod = job.jobSalaryPeriod {
                        Text("$\(jobMaxSalary)/\(jobSalaryPeriod)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                    }
                }
                HStack{
                    if let jobCity = job.jobCity, let jobState = job.jobState {
                        Text("\(jobCity), \(jobState)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                    }
                    Spacer()
                    if let jobPostedAtTimestamp = job.jobPostedAtTimestamp {
                        Text(timeSince(from: Int(jobPostedAtTimestamp)))
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                    }
                }
            }
            ).padding()
                .background(backgroundColor)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(backgroundColor)
                )
            //            .frame(idealWidth: 260)
                .frame(width: 260)
        }
    }
}

#Preview {
    JobCard(job: Job.sampleJobsData[2])
}
