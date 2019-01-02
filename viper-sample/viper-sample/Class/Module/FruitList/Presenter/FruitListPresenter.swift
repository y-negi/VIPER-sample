//
//  FruitListPresenter.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation

final class FruitListPresenter {

    weak var view: FruitListViewProtocol?
    var interactor: FruitListInteractorInputProtocol
    var router: FruitListRouterProtocol
    
    private var fruits: [Fruit] = []
    
    init(view: FruitListViewProtocol, interactor: FruitListInteractorInputProtocol, router: FruitListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

// MARK: - FruitListPresenterProtocol

extension FruitListPresenter: FruitListPresenterProtocol {
    
    func viewDidLoad() {
        self.interactor.loadFruits()
    }
    
    func didSelectRow(at index: IndexPath) {
        guard index.row < self.fruits.count else { return }
        
        self.router.showFruitDetail(self.fruits[index.row])
    }
    
}

// MARK: - FruitListInteractorOutputProtocol

extension FruitListPresenter: FruitListInteractorOutputProtocol {
    
    func didLoadedFruits(_ fruits: [Fruit]) {
        self.fruits = fruits
        self.view?.reloadData(fruits.map { FruitListCellType.fruit(fruit: $0) })
    }
    
    func didFailedLoadFruits() {
        print("Load Fruits Failed")
    }
    
}
