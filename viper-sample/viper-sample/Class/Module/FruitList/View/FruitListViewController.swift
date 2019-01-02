//
//  FruitListViewController.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import UIKit

final class FruitListViewController: UIViewController {
    
    var presenter: FruitListPresenterProtocol?
    
    private var cells: [FruitListCellType] = []
    
    @IBOutlet private weak var fruitListTableView: UITableView! {
        didSet {
            self.fruitListTableView.register(UINib(nibName: "FruitListTableViewCell", bundle: nil),
                                             forCellReuseIdentifier: "FruitListTableViewCell")
            self.fruitListTableView.tableFooterView = UIView()
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
    }

}

// MARK: - FruitListViewProtocol

extension FruitListViewController: FruitListViewProtocol {
    
    func reloadData(_ datas: [FruitListCellType]) {
        self.cells = datas
        
        self.fruitListTableView.reloadData()
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FruitListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitListTableViewCell", for: indexPath) as! FruitListTableViewCell
        
        switch cells[indexPath.row] {
        case .fruit(let fruit):
            cell.nameLabel.text = fruit.name
            cell.descriptionLabel.text = fruit.description
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        self.presenter?.didSelectRow(at: indexPath)
    }
    
}
