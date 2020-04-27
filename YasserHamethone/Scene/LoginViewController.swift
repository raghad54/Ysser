//
//  LoginViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/20/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit
import ARSLineProgress
import TextFieldEffects

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var nameTextFeild: TextFieldEffects!
    @IBOutlet weak var passwordTextFeild: TextFieldEffects!

    override func viewDidLoad() {
        super.viewDidLoad()
       //  ARSLineProgress.hide()
        

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func loginButtonTapped(_ sender: UIButton){
        if nameTextFeild.text! == "1122334455" && passwordTextFeild.text! == "r8d199501995" {
            ARSLineProgress.show()
             DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "TTabBarViewController") as! TTabBarViewController
             self.navigationController?.pushViewController(homeViewController, animated: true)
            }
        }
            else{
                showBanner(title: "Warning", subtitle: "All Feilds Required", color: BannerColors.lightGraybackround ,warning: true)

            }
        }
        
    
    
    @IBAction func signupButton(_ sender: UIButton){
         let signUpViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpViewController, animated: true)
        
    }

}
