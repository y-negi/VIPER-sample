//
//  FruitDetailProtocols.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation
import UIKit

// MARK: - View

protocol FruitDetailViewProtocol: AnyObject {
    var presenter: FruitDetailPresenterProtocol? { get set }
    
    func showFruitDetail(name: String, description: String)
}

// MARK: - Presenter

protocol FruitDetailPresenterProtocol: AnyObject {
    var view: FruitDetailViewProtocol? { get set }
    var router: FruitDetailRouterProtocol { get set }
    
    func viewDidLoad()
}

// MARK: - Router

protocol FruitDetailRouterProtocol: AnyObject {
    static func createFruitDetailModule(fruit: Fruit) -> UIViewController
}
