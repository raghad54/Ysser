//
//  CodeForGovermentViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/22/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class CodeForGovermentViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    @IBAction func continueButtonTapped(_ sender:   UIButton){
             let homeViewController = storyboard?.instantiateViewController(withIdentifier: "TTabBarViewController") as! TTabBarViewController
            self.navigationController?.pushViewController(homeViewController, animated: true)
       }
    
    @IBAction func backButton(_ sender: UIButton){
              self.navigationController?.popViewController(animated: true)
          }

}
