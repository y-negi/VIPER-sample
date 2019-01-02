//
//  FruitListPresenterTests.swift
//  viper-sampleTests
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import XCTest

class FruitListPresenterTests: XCTestCase {
    
    let view = ViewMock()
    let interactor = InteractorMock()
    let router = RouterMock()
    var presenter: FruitListPresenter!

    override func setUp() {
        super.setUp()
        
        self.presenter = FruitListPresenter(view: self.view, interactor: self.interactor, router: self.router)
        self.interactor.output = self.presenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Tests
    
    func test_viewDidLoad() {
        XCTContext.runActivity(named: "viewDidLoadが呼ばれたとき") { _ in
            let before = self.interactor.callCount_loadFruits
            self.presenter.viewDidLoad()
            
            XCTContext.runActivity(named: "Fruits取得が行われているか") { _ in
                XCTAssertEqual(before + 1, self.interactor.callCount_loadFruits)
            }
        }
    }
    
    func test_didSelectRow() {
        XCTContext.runActivity(named: "didSelectRowが呼ばれた時") { _ in
            self.presenter.didSelectRow(at: IndexPath(row: 0, section: 0))
            
            XCTContext.runActivity(named: "遷移処理が行われているか", block: { _ in
                XCTAssert(!self.router.isCalled_showFruitDetail)
            })
        }
    }
    
    // MARK: - Mock
    
    class ViewMock: FruitListViewProtocol {
        var presenter: FruitListPresenterProtocol?
        
        var callCount_reloadData = 0
        func reloadData(_ datas: [FruitListCellType]) {
            self.callCount_reloadData += 1
        }
    }
    
    class InteractorMock: FruitListInteractorInputProtocol {
        var output: FruitListInteractorOutputProtocol?
        
        var callCount_loadFruits = 0
        func loadFruits() {
            self.callCount_loadFruits += 1
        }
    }
    
    class RouterMock: FruitListRouterProtocol {
        static func createFruitListModule() -> UIViewController {
            return UIViewController()
        }
        
        var isCalled_showFruitDetail = false
        func showFruitDetail(_ fruit: Fruit) {
            self.isCalled_showFruitDetail = true
        }
    }

}
