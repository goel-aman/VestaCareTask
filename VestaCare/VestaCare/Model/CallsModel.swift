//
//  CallsModel.swift
//  VestaCare
//
//  Created by aman on 27/04/24.
//

struct Call: Codable {
    let Sid: String
    let DateCreated: String
    let DateUpdated: String
    let AccountSid: String
    let To: String
    let From: String
    let PhoneNumber: String
    let PhoneNumberSid: String
    let Status: String
    let StartTime: String
    let EndTime: String
    let Duration: String
    let Price: String
    let Direction: String
    let AnsweredBy: String
    let Uri: String
    let CustomField: String
}

struct Response: Codable {
//    let Metadata: Metadata
    let Call: [Call]
}


struct Output: Codable {
    let response: Response
}

struct Metadata: Codable {
    let Total: String
    let PageSize: String
    let FirstPageUri: String
    let PrevPageUri: String?
    let NextPageUri: String?
}

//struct RecentCallData {
//    let duration: String
//    let callType: String
//    let date: String
//}
