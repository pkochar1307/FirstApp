//
//  SecretViewController.swift
//  FirstApp
//
//  Created by MacMini03 on 11/10/19.
//  Copyright © 2019 MacMini03. All rights reserved.
//

import UIKit

class SecretViewController: UIViewController {
    
    
    @IBOutlet weak var secretLabel1: UITextField!

    var secretMessage1 : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secretLabel1.text = secretMessage1
    }
    
}

