//
//  InputViewController.swift
//  SampleRealmSwift
//
//  Created by 菅原勝也 on 2017/09/25.
//  Copyright © 2017年 instil. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.frame.size.height = 30
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Buttonが押された時の処理
    @IBAction func addButtonTapped(sender: AnyObject) {
        
    }

}
