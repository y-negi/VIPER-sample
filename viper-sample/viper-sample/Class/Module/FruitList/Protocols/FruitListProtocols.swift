//
//  FruitListProtocols.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation
import UIKit

// MARK: - View

protocol FruitListViewProtocol: AnyObject {
    var presenter: FruitListPresenterProtocol? { get set }
    // MEMO: 従来のMVPのように、Viewに依頼するアクションが並ぶイメージ。
    func reloadData(_ datas: [FruitListCellType])
}

// MARK: - Presenter

protocol FruitListPresenterProtocol: AnyObject {
    // MEMO: ここで持ちうるモジュールを宣言しておくかは悩みどころ。ここで宣言してるとinternalになっちゃう。ただ、protocolファーストで実装していくこととか考えるとここで宣言しておくと頭の整理がしやすいかも。
    var view: FruitListViewProtocol? { get set }
    var interactor: FruitListInteractorInputProtocol { get set }
    var router: FruitListRouterProtocol { get set }
    
    // MEMO: ViewでのInputが並ぶイメージ。
    func viewDidLoad()
    func didSelectRow(at index: IndexPath)
}

// MARK: - Interactor

protocol FruitListInteractorInputProtocol: AnyObject {
    var output: FruitListInteractorOutputProtocol? { get set }
    
    // MEMO: この画面で想定されるモデルへの依頼が並ぶ。UseCaseのようなイメージ。
    func loadFruits()
}

protocol FruitListInteractorOutputProtocol: AnyObject {
    // MEMO: Inputに対するOutputが並ぶイメージ。
    func didLoadedFruits(_ fruits: [Fruit])
    func didFailedLoadFruits()
}

// MARK: - Router

protocol FruitListRouterProtocol: AnyObject {
    // MEMO: この辺のモジュール(VIPR)の生成。
    static func createFruitListModule() -> UIViewController
    
    // MEMO: この画面で起こりうる画面遷移。
    func showFruitDetail(_ fruit: Fruit)
}

// MARK: - Others

// MEMO: モジュール内で使うInternal以上の定義をどこでするか悩んだのでここに置いてみた。
enum FruitListCellType {
    case fruit(fruit: Fruit)
}
