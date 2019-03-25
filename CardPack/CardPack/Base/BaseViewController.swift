//
//  BaseViewController.swift
//  Pixabay
//
//  Created by PlutusCat on 2018/6/11.
//  Copyright © 2018年 Pixabay. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .automatic
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("=== didReceiveMemoryWarning ===")
    }
    
    deinit {
        print("deinit == ", self)
    }

}
