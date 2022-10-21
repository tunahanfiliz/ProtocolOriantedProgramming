//
//  ViewController.swift
//  dependencyInjection
//
//  Created by Ios Developer on 21.10.2022.
//

import UIKit

class UserViewController: UIViewController,UserViewModelOutput {
    func updateView(name: String, userName: String, email: String) {
        self.namelabel.text = name
        self.usernamelabel.text = userName
        self.emaillabel.text = email
    }
    
    private let viewModel : UserViewModel
    
    private let namelabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emaillabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernamelabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.fetchUsers()
    }
    
    private func setupViews(){
        view.backgroundColor = .yellow
        view.addSubview(emaillabel)
        view.addSubview(usernamelabel)
        view.addSubview(namelabel)
        
        NSLayoutConstraint.activate(
        [
            namelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), //x ekseninde ortaya koy
            namelabel.heightAnchor.constraint(equalToConstant: 60), //yazı boyutu
            namelabel.widthAnchor.constraint(equalToConstant: 200),
            namelabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100), // yukarıya daya ama arada 100 piksel kalsın
        
            usernamelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), //x ekseninde ortaya koy
            usernamelabel.heightAnchor.constraint(equalToConstant: 60), //yazı boyutu
            usernamelabel.widthAnchor.constraint(equalToConstant: 200),
            usernamelabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 10), // namelabele sabitle ona 10 piksel kalsın
            
            emaillabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), //x ekseninde ortaya koy
            emaillabel.heightAnchor.constraint(equalToConstant: 60), //yazı boyutu
            emaillabel.widthAnchor.constraint(equalToConstant: 200),
            emaillabel.topAnchor.constraint(equalTo: usernamelabel.bottomAnchor, constant: 10)
        ]
        
        
        
        )
    }
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self // selfe eşitlemeliyiz delegate pattern için
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

