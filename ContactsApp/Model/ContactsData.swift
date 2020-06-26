//
//  ContactsData.swift
//  ContactsApp
//
//  Created by Nikhil on 02/12/19.
//  Copyright © 2019 Nikhil. All rights reserved.
//

import Foundation
struct User: Identifiable, Codable {
    var id = UUID()
    var userId: Int
    var userName: String {
        return (firstname ?? "").capitalized + " " + (lastName ?? "").capitalized
    }
    let firstname, lastName: String?
    let profilePic: String
    let favorite: Bool
    enum CodingKeys: String, CodingKey {
        case firstname = "first_name"
        case lastName = "last_name"
        case profilePic = "profile_pic"
        case userId = "id"
        case favorite
    }
}
struct Detail: Identifiable, Codable {
    var userName: String {
        return (firstname ?? "").capitalized + " " + (lastName ?? "").capitalized
    }
    var id = UUID()
    var userId: Int
    let firstname, lastName: String?
    let profilePic: String
    // MARK:- Email and phone number can be optional
    let email, phoneNumber: String?
    let favorite: Bool
    enum CodingKeys: String, CodingKey {
        case firstname = "first_name"
        case lastName = "last_name"
        case profilePic = "profile_pic"
        case userId = "id"
        case phoneNumber  = "phone_number"
        case favorite, email
    }
}
