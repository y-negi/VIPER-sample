//
//  FruitDetailPresenter.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation

final class FruitDetailPresenter {
    
    weak var view: FruitDetailViewProtocol?
    var router: FruitDetailRouterProtocol
    
    private let fruit: Fruit
    
    init(view: FruitDetailViewProtocol, router: FruitDetailRouterProtocol, fruit: Fruit) {
        self.view = view
        self.router = router
        self.fruit = fruit
    }
    
}

// MARK: - FruitDetailPresenterProtocol

extension FruitDetailPresenter: FruitDetailPresenterProtocol {
    
    func viewDidLoad() {
        self.view?.showFruitDetail(name: self.fruit.name,
                                   description: self.fruit.description)
    }
    
}
