//
//  FruitDetailRouter.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation
import UIKit

final class FruitDetailRouter: FruitDetailRouterProtocol {
    
    static func createFruitDetailModule(fruit: Fruit) -> UIViewController {
        let view = FruitDetailViewController()
        let router = FruitDetailRouter()
        let presenter = FruitDetailPresenter(view: view, router: router, fruit: fruit)
        
        view.presenter = presenter
        
        return view
    }
    
}
