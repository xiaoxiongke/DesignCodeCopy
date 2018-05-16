//
//  Realm.swift
//  PatronCN
//
//  Created by eorin on 2018/5/16.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit
import RealmSwift

class User:Object{
    @objc dynamic var id = 1
    @objc dynamic var email = ""
    @objc dynamic var password = ""
    @objc dynamic var date = ""
    @objc dynamic var plan = ""
    @objc dynamic var endDate:NSDate? = nil
    
}

struct RealmService {
    
    static func updateUsser(sender:DataUser,completion:@escaping () ->() ){
        if let user = getUser(){
            let realm = try? Realm()
            try? realm?.write {
                user.setValue(sender.id, forKey: "id")
                user.setValue(sender.email, forKey: "email")
                user.setValue(sender.password, forKey: "password")
                user.setValue(sender.date, forKey: "date")
                user.setValue(sender.plan, forKey: "plan")
                user.setValue(sender.endDate, forKey: "endDate")
                completion()
            }
        }
    }
    
    static func getUser() ->User?{
        let realm = try? Realm()
        let user = realm?.objects(User.self).first
        return user
    }
    
    static func isUserSuscribed() ->Bool{
        if let user = getUser(){
            if user.date != ""{
                return true
            }
        }
        return false
    }
    
    static func logout(completion:@escaping () ->()){
        if let user = getUser(){
            let guest = DataUser(id: String(user.id), email: user.email, password: user.password, plan: "", date: "", endDate: Date())
            updateUsser(sender: guest) {
                completion()
            }
        }
    }
}
