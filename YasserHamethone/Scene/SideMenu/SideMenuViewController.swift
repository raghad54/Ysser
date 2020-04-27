//
//  SideMenuViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/24/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit
import ARSLineProgress

class SideMenuViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var sideTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = sideTableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell", for: indexPath) as! SideMenuTableViewCell
        if indexPath.row  == 0 {
            
            cell.labelName.text! = "E-Government"
            cell.imageName.image = UIImage(named: "flag")
            cell.spertaorLine.isHidden = false
            
            
        } else if indexPath.row  == 1 {
            cell.labelName.text! = "Make a report"
            cell.imageName.image = UIImage(named: "report")
            cell.spertaorLine.isHidden = false
            
        }else if indexPath.row  == 2 {
            cell.labelName.text! = "Settings"
            cell.imageName.image = UIImage(named: "settings")
            cell.spertaorLine.isHidden = false
            
        }else if indexPath.row  == 3 {
            cell.labelName.text! = "Logout"
            cell.imageName.image = UIImage(named: "logout")
            cell.spertaorLine.isHidden = false
            
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let homeViewController = storyboard?.instantiateViewController(withIdentifier: "ElectronicGateViewController") as! ElectronicGateViewController
                   self.navigationController?.pushViewController(homeViewController, animated: true)
            
        } else if indexPath.row == 1 {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "MakeReportViewController") as! MakeReportViewController
        self.navigationController?.pushViewController(homeViewController, animated: true)
            
        } else if indexPath.row == 2 {
            
        } else if indexPath.row == 3 {
             ARSLineProgress.show()
            
           for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: LoginViewController.self) {
                     ARSLineProgress.hide()
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
            
        }
    }
    
    
    
}
