//
//  ViewController.swift
//  To-do list
//
//  Created by Dayna Grigsby on 9/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Hello: UIButton!
    
    @IBOutlet weak var AppTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func m_hello(_ sender: Any) {
        AppTitle.text = "HIIII"
        
    
    }
    
}

