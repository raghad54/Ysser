//
//  MakeReportViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/25/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class MakeReportViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func callNumber(_sender:UIButton){
        let phone = 999
       if let url = URL(string: "tel://\(phone)") {
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
       }

    }
    
    @IBAction func backButton(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}
