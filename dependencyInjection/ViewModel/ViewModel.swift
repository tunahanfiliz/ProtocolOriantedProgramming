//
//  ViewModel.swift
//  dependencyInjection
//
//  Created by Ios Developer on 21.10.2022.
//

import Foundation

class UserViewModel {
    
    weak var output: UserViewModelOutput? // SADECE ONA ERİŞİLDİGİNDE İNİTİAL EDİLCEK ONDAN WEAK
    
    private let userService : UserService
    init(userService: UserService) {
        self.userService = userService
    }
    func fetchUsers(){
        userService.fetchUser { [weak self]result in //WEAK LA UYUMLU OLSUN DİYE WEAK SELF
            switch result{
            case .success(let user):
                self?.output?.updateView(name: user.name, userName: user.username, email: user.email)
            case .failure(_):
                self?.output?.updateView(name: "no name", userName: "", email: "")
                
            }
                
        }
    }
    
}

