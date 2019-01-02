//
//  FruitListInteractor.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation

final class FruitListInteractor {
    
    weak var output: FruitListInteractorOutputProtocol?
    
}

// MARK: - FruitListInteractorInputProtocol

extension FruitListInteractor: FruitListInteractorInputProtocol {
    
    func loadFruits() {
        // 仮で適当にjson見てる
        let data = FileHandle(forReadingAtPath: Bundle.main.path(forResource: "Fruits", ofType: "json")!)!.readDataToEndOfFile()

        if let response = try? JSONDecoder().decode(FruitsAPIResponse.self, from: data) {
            let fruits = response.fruits.map { Fruit(name: $0.name, description: $0.description) }
            self.output?.didLoadedFruits(fruits)
        } else {
            self.output?.didFailedLoadFruits()
        }
    }
    
}
