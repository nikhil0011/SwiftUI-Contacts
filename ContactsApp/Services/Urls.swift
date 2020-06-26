//
//  Urls.swift
//  ContactsApp
//
//  Created by Nikhil on 02/12/19.
//  Copyright © 2019 Nikhil. All rights reserved.
//

import Foundation
struct EndPoints {
    static let BASE_URL: String = "http://gojek-contacts-app.herokuapp.com"
    static let GET_CONTACTS: String = BASE_URL + "/contacts.json"
    static func returnContactDetailUrl(id: Int) -> String {
        return BASE_URL + "/contacts/" + "\(id)" + ".json"
    }
}
