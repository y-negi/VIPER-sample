//
//  FruitsAPIResponse.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation

struct FruitsAPIResponse: Decodable {
    struct FruitsElement: Decodable {
        var name: String
        var description: String
    }
    
    var fruits: [FruitsElement]
}
