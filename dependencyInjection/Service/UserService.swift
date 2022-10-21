//
//  UserService.swift
//  dependencyInjection
//
//  Created by Ios Developer on 21.10.2022.
//

import Foundation

protocol UserService{
    func fetchUser(completion: @escaping(Result<User,Error>)-> Void)
}
