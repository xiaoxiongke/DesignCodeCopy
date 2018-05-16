//
//  DSCService.swift
//  PatronCN
//
//  Created by eorin on 2018/5/15.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit

struct DCService {
    static let baseUrl = "baseUrl"
    static let session = URLSession.shared
    static let decoder = JSONDecoder()
    
    static func login(email:String,password:String,completion: @escaping(_ user:DataUser?) ->()){
        if email == "demo" && password == "demo"{
            let user = DataUser(id: "demo", email: email, password: password, plan: "trail", date: "2018年05月15日", endDate: Date())
            completion(user)
        }else{
            completion(nil)
        }
    }
    
}
