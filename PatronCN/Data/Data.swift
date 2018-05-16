//
//  Data.swift
//  PatronCN
//
//  Created by eorin on 2018/5/15.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit

struct DataUser:Codable{
    var id:String
    var email:String
    var password:String
    var plan:String
    var date:String
    var endDate:Date
}

