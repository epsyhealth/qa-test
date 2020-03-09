//
//  APIService.swift
//  UserList
//
//  Created by Manuel Entrena on 09/03/2020.
//  Copyright © 2020 Manuel Entrena. All rights reserved.
//

import Foundation

enum APIError: Error {
    case endpoint
    case badResponse
}

class APIService {
    let baseURL = "https://jsonplaceholder.typicode.com/"
    let usersEndpoint = "users"
    
    let session = URLSession(configuration: .default)
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> ()) {
        
        guard let url = URL(string: baseURL + usersEndpoint) else {
            completion(.failure(APIError.endpoint))
            return
        }
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    completion(.success(users))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(APIError.badResponse))
            }
        }
        task.resume()
    }
}
