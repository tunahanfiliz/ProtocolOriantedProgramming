//
//  userviewModelOutput.swift
//  dependencyInjection
//
//  Created by Ios Developer on 22.10.2022.
//

import Foundation

protocol UserViewModelOutput: AnyObject{ //VİEW MODELDE WEAK VAR YAPABİLMEK İÇİN ANY OBJECT YAPMAK GEREKİR
    func updateView(name:String, userName:String,email:String)
}


// bu userview out putu view de kullancaz classın içibde çagırcaz göstermek için degerleri

//birde view model de çagırcaz başarılı olursa isim ne olsun degerini alcaz
