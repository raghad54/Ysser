//
//  SplashViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/20/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
              let ttabBarViewController = self.storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
                    self.navigationController!.pushViewController(ttabBarViewController!, animated: true)

               }
   
    }
    

  

}
