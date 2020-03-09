//
//  User.swift
//  UserList
//
//  Created by Manuel Entrena on 09/03/2020.
//  Copyright © 2020 Manuel Entrena. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let website: String?
    let company: Company?
    let address: Address?
}
