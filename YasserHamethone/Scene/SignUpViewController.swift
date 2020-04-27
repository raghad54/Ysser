//
//  SignUpViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/20/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit
import TextFieldEffects
import ARSLineProgress

class SignUpViewController: BaseViewController {
    
    @IBOutlet weak var idNumberTextFeild: TextFieldEffects!
    @IBOutlet weak var phoneTextFeild: TextFieldEffects!
    @IBOutlet weak var passwordTextFeild: TextFieldEffects!
    @IBOutlet weak var confirmationTextFeild: TextFieldEffects!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpButtonTapped(_ sender: UIButton){
        if idNumberTextFeild.text! != "" && phoneTextFeild.text! != "" && passwordTextFeild.text! != "" && confirmationTextFeild.text! != "" {
            ARSLineProgress.show()
             let homeViewController = storyboard?.instantiateViewController(withIdentifier: "TTabBarViewController") as! TTabBarViewController
            self.navigationController?.pushViewController(homeViewController, animated: true)
        } else {
              showBanner(title: "Warning", subtitle: "All Feilds Required", color: BannerColors.lightGraybackround ,warning: true)
        }
       }
    
    @IBAction func loginButtonTapped(_ sender: UIButton){
                let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
               self.navigationController?.pushViewController(loginViewController, animated: true)
          }
    
    @IBAction func ifYouWork(_ sender: UIButton){
                   let loginViewController = storyboard?.instantiateViewController(withIdentifier: "CodeForGovermentViewController") as! CodeForGovermentViewController
                  self.navigationController?.pushViewController(loginViewController, animated: true)
             }
    
    @IBAction func backButton(_ sender: UIButton){
              self.navigationController?.popViewController(animated: true)
          }
       
}
