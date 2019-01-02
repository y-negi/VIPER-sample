//
//  FruitDetailViewController.swift
//  viper-sample
//
//  Created by 根岸裕太 on 2019/01/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import UIKit

final class FruitDetailViewController: UIViewController {
    
    var presenter: FruitDetailPresenterProtocol?
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
    }

}

// MARK: - FruitDetailViewProtocol

extension FruitDetailViewController: FruitDetailViewProtocol {
    
    func showFruitDetail(name: String, description: String) {
        self.nameLabel.text = name
        self.descriptionLabel.text = description
    }
    
}
