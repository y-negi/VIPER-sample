//
//  FruitListRouter.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation
import UIKit

final class FruitListRouter {
    
    // 画面遷移のためにViewControllerが必要。initで受け取る
    private weak var viewController: UIViewController?
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func createFruitListModule() -> UIViewController {
        let view = FruitListViewController()
        let interactor = FruitListInteractor()
        let router = FruitListRouter(viewController: view)
        let presenter = FruitListPresenter(view: view, interactor: interactor, router: router)
        
        interactor.output = presenter
        view.presenter = presenter
        
        return view
    }
    
}

// MARK: - FruitListRouterProtocol

extension FruitListRouter: FruitListRouterProtocol {
    
    func showFruitDetail(_ fruit: Fruit) {
        let detailView = FruitDetailRouter.createFruitDetailModule(fruit: fruit)
        self.viewController?.navigationController?.pushViewController(detailView, animated: true)
    }

}
