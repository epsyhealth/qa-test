//
//  Address.swift
//  UserList
//
//  Created by Manuel Entrena on 09/03/2020.
//  Copyright © 2020 Manuel Entrena. All rights reserved.
//

import Foundation

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo?
}
