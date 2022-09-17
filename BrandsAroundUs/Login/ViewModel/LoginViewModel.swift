//
//  LoginViewModel.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/12/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

class LoginViewModel {
    
    var loginModel = LoginModel()
    
    func Login(onSuccess: @escaping() -> Void, onFailure: @escaping(String) -> Void) {
        
        if loginModel.userName == "" {
            onFailure("Username is empty")
            return
        } else if loginModel.password == "" {
            onFailure("Password is empty")
            return
        } else {
            //call API
        }
        
        
    }
    
    
    
}
