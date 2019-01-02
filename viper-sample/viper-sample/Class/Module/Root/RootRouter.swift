//
//  RootRouter.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation
import UIKit

final class RootRouter {
    
    private init() {}
    
    static func showFirstView(window: UIWindow) {
        let firstView = FruitListRouter.createFruitListModule()
        let navigationController = UINavigationController(rootViewController: firstView)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
