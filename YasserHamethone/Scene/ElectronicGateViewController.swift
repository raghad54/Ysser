//
//  ElectronicGateViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/26/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class ElectronicGateViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIButton){
           self.navigationController?.popViewController(animated: true)
       }

}
