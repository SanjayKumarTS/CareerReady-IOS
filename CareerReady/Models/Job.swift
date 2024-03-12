//
//  Job.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 3/11/24.
//

import Foundation

struct Job: Codable, Identifiable {
    var id: String
    var employerName: String?
    var employerLogo: String?
    var employerWebsite: String?
    var employerCompanyType: String?
    var jobEmploymentType: String?
    var jobTitle: String?
    var jobApplyLink: String?
    var jobDescription: String?
    var jobIsRemote: Bool?
    var jobPostedAtTimestamp: Int?
    var jobPostedAtDatetimeUtc: String?
    var jobCity: String?
    var jobState: String?
    var jobCountry: String?
    var jobLatitude: Double?
    var jobLongitude: Double?
    var jobRequiredExperience: JobExperience
    var jobRequiredSkills: String?
    var jobMinSalary: Int?
    var jobMaxSalary: Int?
    var jobSalaryCurrency: String?
    var jobSalaryPeriod: String?
    var jobHighlights: JobHighlights
}

struct JobExperience: Codable {
    var noExperienceRequired: Bool?
    var requiredExperienceInMonths: Int?
    var experienceMentioned: Bool?
    var experiencePreferred: Bool?
}

struct JobHighlights: Codable {
    var qualifications: [String]
    var responsibilities: [String]
}

extension Job {
    static let sampleJobsData: [Job] =
    [
        Job(
            id: "Dom08mfP2TYjUKz7AAAAAA==",
            employerName: "Walmart",
            employerLogo: "https://cmofbrownsville.org/wp-content/uploads/2019/03/walmart-logo.png",
            employerWebsite: "https://www.walmart.com",
            employerCompanyType: "Retail",
            jobEmploymentType: "FULLTIME",
            jobTitle: "Software Engineer II",
            jobApplyLink: "https://careers.walmart.com/us/jobs/WD1813873-software-engineer-ii",
            jobDescription: "Position Summary...\n\nWhat you'll do...\n\nPayroll full stack team is responsible for developing and maintaining a full spectrum of responsive web and mobile applications, associate and business facing, which help in ensuring that the associate is paid right, the right taxes are deducted, and most important, ensuring that associate has an understanding of the deductions and other expenses from his paycheck using a paystub. We are on the cusp of digital transformation in the payroll space and with this team it will always be your day one and we are looking for someone with the right attitude to be a part of this dynamic team.\n\nIf this excites you go ahead and apply and we will be in touch\n\nAbout Team:\nThe Enterprise People Technology team supports the successful deployment and adoption of new People technology across the enterprise. As a Fortune #1 company, our work impacts millions of associates globally. We strive to continuously improve people technology and products to help managers and associates so they can focus on what matters most - supporting our customers and members. People Technology is one of the major segments of Walmart Global Tech’s Enterprise Business Services, which is invested in building a compact, robust organization that includes service operations and technology solutions for Finance, People, and the Associate Digital Experience.\n\nWhat you'll do:\n• Review, and understand business and technical needs to get a deep understanding on the solution you would enhance / develop / support\n• Develop applications based on design specifications; including coding, testing, debugging, documenting and reviewing and/or refining across the application development stages in accordance with defined standards for development and security\n• Assess and test the overall effectiveness and performance of an application, involving the setting up of suitable testing conditions, definition of test cases and/or technical criteria\n• Identify causes of defects and conduct analysis to avoid recurrence of the issues and improve the quality and performance of the product/solution\n• Conduct monitoring, maintenance and related activities including documentation, deployment, operation, security, configuration management, training (users and sustainment personnel), technology updates, and retirement of software and system applications\n• Support in ensuring adherence to program metrics and provide information to correct deficiencies or any identified risks in the achievement of program objectives\n\nWhat you'll bring:\n• Deep Knowledge in Software architecture, Micro Services, Java based APIs and systems testing.\n• Strong development experience in an OO language (Java, python, C++, C#, etc.)\n• Experience with Java, Spring Boot\n• Requires knowledge of System performance, Application Security, monitoringtools, metrics and techniques, Test Automation and Test Driven Development.\n• Experience operating software running on a containerized platform (Docker, Kubernetes, etc..)\n• Experience in continuous integration and delivery.\n• Experience with engineering best practices, including use of design patterns, and code reviews.\n• Good understanding of version control systems, preferably GIT.\n\nAbout Walmart Global Tech\nImagine working in an environment where one line of code can make life easier for hundreds of millions of people. That’s what we do at Walmart Global Tech. We’re a team of software engineers, data scientists, cybersecurity expert's and service professionals within the world’s leading retailer who make an epic impact and are at the forefront of the next retail disruption. People are why we innovate, and people power our innovations. We are people-led and tech-empowered. We train our team in the skillsets of the future and bring in experts like you to help us grow. We have roles for those chasing their first opportunity as well as those looking for the opportunity that will define their career. Here, you can kickstart a great career in tech, gain new skills and experience for virtually every industry, or leverage your expertise to innovate at scale, impact millions and reimagine the future of retail.\n\nFlexible, hybrid work:\nWe use a hybrid way of working that is primarily in office coupled with virtual when not onsite. Our campuses serve as a hub to enhance collaboration, bring us together for purpose and deliver on business needs. This approach helps us make quicker decisions, remove location barriers across our global team and be more flexible in our personal lives.\n\nBenefits:\nBenefits: Beyond our great compensation package, you can receive incentive awards for your performance. Other great perks include 401(k) match, stock purchase plan, paid maternity and parental leave, PTO, multiple health plans, and much more.\n\nEqual Opportunity Employer:\nWalmart, Inc. is an Equal Opportunity Employer – By Choice. We believe we are best equipped to help our associates, customers and the communities we serve live better when we really know them. That means understanding, respecting and valuing diversity- unique styles, experiences, identities, ideas and opinions – while being inclusive of all people.\n\nThe above information has been designed to indicate the general nature and level of work performed in the role. It is not designed to contain or be interpreted as a comprehensive inventory of all responsibilities and qualifications required of employees assigned to this job. The full Job Description can be made available as part of the hiring process.\n\nMinimum Qualifications...\n\nOutlined below are the required minimum qualifications for this position. If none are listed, there are no minimum qualifications.\n\nOption 1: Bachelor's degree in computer science, computer engineering, computer information systems, software engineering, or related area.Option 2: 3 years’ experience in software engineering or related area.\n\nPreferred Qualifications...\n\nOutlined below are the optional preferred qualifications for this position. If none are listed, there are no preferred qualifications.\n\nCertification in Security+, Network+, GISF, or GSEC\n\nPrimary Location...\n603 MUNGER AVE STE 400, DALLAS, TX 75202, United States of America",
            jobIsRemote: false,
            jobPostedAtTimestamp:1709856000,
            jobPostedAtDatetimeUtc: "2024-03-08T00:00:00.000Z",
            jobCity: "Dallas",
            jobState: "TX",
            jobCountry: "US",
            jobLatitude: 32.776665,
            jobLongitude: -96.79699,
            jobRequiredExperience: JobExperience(
                noExperienceRequired: false,
                requiredExperienceInMonths: 24,
                experienceMentioned: true,
                experiencePreferred: false),
            jobRequiredSkills: nil,
            jobMinSalary: nil,
            jobMaxSalary: nil,
            jobSalaryCurrency: nil,
            jobSalaryPeriod: nil,
            jobHighlights: JobHighlights(
                qualifications: [
                    "Deep Knowledge in Software architecture, Micro Services, Java based APIs and systems testing",
                    "Strong development experience in an OO language (Java, python, C++, C#, etc.)",
                    "Experience with Java, Spring Boot",
                    "Requires knowledge of System performance, Application Security, monitoringtools, metrics and techniques, Test Automation and Test Driven Development",
                    "Experience operating software running on a containerized platform (Docker, Kubernetes, etc..)",
                    "Experience in continuous integration and delivery",
                    "Experience with engineering best practices, including use of design patterns, and code reviews",
                    "Good understanding of version control systems, preferably GIT",
                    "Option 1: Bachelor's degree in computer science, computer engineering, computer information systems, software engineering, or related area",
                    "Option 2: 3 years’ experience in software engineering or related area",
                    "Certification in Security+, Network+, GISF, or GSEC"
                ],
                responsibilities: [
                    "Payroll full stack team is responsible for developing and maintaining a full spectrum of responsive web and mobile applications, associate and business facing, which help in ensuring that the associate is paid right, the right taxes are deducted, and most important, ensuring that associate has an understanding of the deductions and other expenses from his paycheck using a paystub",
                    "Review, and understand business and technical needs to get a deep understanding on the solution you would enhance / develop / support",
                    "Develop applications based on design specifications; including coding, testing, debugging, documenting and reviewing and/or refining across the application development stages in accordance with defined standards for development and security",
                    "Assess and test the overall effectiveness and performance of an application, involving the setting up of suitable testing conditions, definition of test cases and/or technical criteria",
                    "Identify causes of defects and conduct analysis to avoid recurrence of the issues and improve the quality and performance of the product/solution",
                    "Conduct monitoring, maintenance and related activities including documentation, deployment, operation, security, configuration management, training (users and sustainment personnel), technology updates, and retirement of software and system applications",
                    "Support in ensuring adherence to program metrics and provide information to correct deficiencies or any identified risks in the achievement of program objectives"
                ])),
        Job(
            id: "AvGboffWNjQDXW5tAAAAAA==",
            employerName: "JPMorgan Chase Bank, N.A.",
            employerLogo: "https://lookaside.fbsbx.com/lookaside/crawler/media/?media_id=11465191261",
            employerWebsite: "http://www.jpmorganchase.com",
            employerCompanyType: "Finance",
            jobEmploymentType: "FULLTIME",
            jobTitle: "Software development",
            jobApplyLink: "https://www.talent.com/view?id=ee75c1f79d7e",
            jobDescription: "Promote the delivery of secure software solutions at an iconic organization. Your talent will make a lasting impact in a challenging and rewarding role.\n\nAs a Security Engineer I at JPMorgan Chase within the Cybersecurity Technology Controls organization, you are part of an agile team that works to deliver software solutions that satisfy pre-defined functional and user requirements with the added dimension of preventing misuse, circumvention, and malicious behavior.\n\nAs an entry level member of the security engineering team, you execute basic software solutions through the design, development, and troubleshooting of a single technical area, while gaining skills and experience to grow within your role. Job responsibilities include producing high-quality security solutions, writing secure code, interpreting architecture and design representations, and contributing to the team culture of diversity, equity, inclusion, and respect.\n\nQualifications and skills required include formal training or certification in Computer Science, experience working on software systems, ability to code in languages like Java or Python, and knowledge of data security risks and data privacy standards.",
            jobIsRemote: false,
            jobPostedAtTimestamp: 1710115200,
            jobPostedAtDatetimeUtc: "2024-03-11T00:00:00.000Z",
            jobCity: "Plano",
            jobState: "TX",
            jobCountry: "US",
            jobLatitude: 33.019844,
            jobLongitude: -96.69888,
            jobRequiredExperience: JobExperience(
                noExperienceRequired: false,
                requiredExperienceInMonths: 12,
                experienceMentioned: true,
                experiencePreferred: false
            ),
            jobRequiredSkills: nil,
            jobMinSalary: nil,
            jobMaxSalary: nil,
            jobSalaryCurrency: nil,
            jobSalaryPeriod: nil,
            jobHighlights: JobHighlights(
                qualifications: [
                    "Formal training or certification on Computer Science concepts and 1+ years applied experience",
                    "Basic experience working on software systems and design principles",
                    "Demonstrable ability to code in one or more languages (ie. Java and / or Python)",
                    "Proficiency in developmental toolsets",
                    "Basic knowledge of industry-wide technology trends and best practices",
                    "Basic knowledge of data security risks and data privacy standards",
                    "Ability to work in large, collaborative teams to achieve organizational goals, with a passion to build an inclusive and innovative culture",
                    "Splunk Enterprise experience"
                ],
                responsibilities: [
                    "Promote the delivery of secure software solutions at an iconic organization. Your talent will make a lasting impact in a challenging and rewarding role.",
                    "As an entry level member of the security engineering team, you execute basic software solutions through the design, development, and troubleshooting of a single technical area, while gaining skills and experience to grow within your role.",
                    "Contributes to producing high-quality security solutions in accordance with existing playbooks to satisfy security requirements for internal clients (e.g., product, platform, and application owners).",
                    "Writes secure and high-quality code using the syntax of at least one programming language with peer guidance.",
                    "Interprets architecture and design representations, as well as nonfunctional requirements to develop secure, stable software against a defined architecture.",
                    "Participates in continuity-related awareness, training, educational activities, and exercises.",
                    "Adds to the team culture of diversity, equity, inclusion, and respect. Required qualifications, capabilities, and skills."
                ]
            )
        ),
        Job(
            id: "nn0ozY5rmi5M4-MXAAAAAA==",
            employerName: "Amazon",
            employerLogo: "https://visualhierarchy.co/blog/wp-content/uploads/2018/04/amazon.jpg",
            employerWebsite: "https://www.amazon.com",
            employerCompanyType: "Retail",
            jobEmploymentType: "FULLTIME",
            jobTitle: "Software Development Engineer at Amazon in Dallas, TX",
            jobApplyLink: "https://geebo.com/jobs-online/view/id/1054596463-software-development-engineer-at-/",
            jobDescription: "Description:\nAt Amazon People Technology, the platform group is responsible for building a new state of art cloud native data platform and services to securely house and vend mission critical workforce information. The new platform will be a critical glue and will offer highly scalable services to power numerous business critical systems that keep Amazon going. We are looking for passionate Software Engineers who have experience building innovative, applications that customers love. As a member of the team you will help with design, implementation and launch of many key product features. You will have influence on defining product features, drive operational excellence, and spearhead the best practices that enable a quality product. An ideal SDE candidate is clearly passionate about delivering experiences that delight customers. A commitment to teamwork, hustle, and strong communication skills (to both business and technical partners) are absolute requirements. Creating reliable, scalable, and high performance products requires exceptional technical expertise, a sound understanding of the fundamentals of Computer Science, and practical experience building large-scale distributed systems. About the hiring group Benefits Tech is a completely new organization. Amazon has been reliant on vendor services for benefits, and we're just now taking the opportunity to build in-house technology to provide the best experience for Amazonians! Key job responsibilities include leading the architecture, design, development, and launch of core product features.",
            jobIsRemote: false,
            jobPostedAtTimestamp: 1709942400,
            jobPostedAtDatetimeUtc: "2024-03-09T00:00:00.000Z",
            jobCity: "Dallas",
            jobState: "TX",
            jobCountry: "US",
            jobLatitude: 32.776665,
            jobLongitude: -96.79699,
            jobRequiredExperience: JobExperience(
                noExperienceRequired: false,
                requiredExperienceInMonths: 12,
                experienceMentioned: true,
                experiencePreferred: true
            ),
            jobRequiredSkills: nil,
            jobMinSalary: 20,
            jobMaxSalary: 28,
            jobSalaryCurrency: "USD",
            jobSalaryPeriod: "HOUR",
            jobHighlights: JobHighlights(
                qualifications: [
                    "An ideal SDE candidate is clearly passionate about delivering experiences that delight customers.",
                    "A commitment to teamwork, hustle, and strong communication skills (to both business and technical partners) are absolute requirements.",
                    "Creating reliable, scalable, and high performance products requires exceptional technical expertise, a sound understanding of the fundamentals of Computer Science, and practical experience building large-scale distributed systems.",
                    "Programming experience with at least one modern language such as Java, C++, or C# including object-oriented design.",
                    "Bachelor's degree in computer science related fields OR 1+ years equivalent experience in software development.",
                    "Experience partnering with product OR program management teams.",
                    "Strong Object Oriented Design and familiarity with application and database programming.",
                    "Experience with Agile/Lean (Kanban, SCRUM, RUP, XP), OO modeling, web services, UNIX, middleware, database and data mining systems.",
                    "Experience with distributed systems architecture and related technology.",
                    "Experience with AWS or other cloud services.",
                    "Knowledge of software engineering best practices for the full software development life cycle, including coding standards, code reviews, source control management, build processes, testing, and operations."
                ],
                responsibilities: [
                    "As a member of the team, you will help with design, implementation, and launch of many key product features.",
                    "You will have influence on defining product features, drive operational excellence, and spearhead the best practices that enable a quality product.",
                    "Responsible for leading the architecture, design, development, and launch of core product features.",
                    "Play a pivotal role in shaping the definition, vision, design, and development of new features from beginning to end.",
                    "Design, implement, test, deploy and maintain innovative software solutions.",
                    "Use software engineering best practices to ensure a high standard of quality for all of the team deliverables.",
                    "Work in an agile, startup-like development environment, where you are always working on the most important stuff."
                ]
            )
        )
    ]
}
