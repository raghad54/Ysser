//
//  NotificationsViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/20/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class NotificationsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var notificationTableView: UITableView!
    
    
    var lableString = ["Riyadh King Fahd Street over Crowded, Please don't go there, Keep your self save",
    "Riyadh, King Abulaziz Stresst is Infected Area , Please Don't go there until another Notification",
    "Riyadh, Faisalya mall there's confirmed Corona case , Please Don't go there until another Notification",
    "Riyadh, Faisalya mall there's confirmed Corona case , Please Don't go there we wanna keep you away from any problems"]
    
    var labelStringSectionThree = ["The city of Riyadh has been completely outlawed. stay home. stay safe",
    "Makkah AlMokramah has been completely outlawed,. stay home. stay safe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationTableView.layer.cornerRadius = 7
        notificationTableView.clipsToBounds = true
        notificationTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
             return 2
        } else  if section == 1{
            return 4
        } else {
            return 1
        }
          
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        
        
        
        if indexPath.section == 2 {
            cell.roundedView.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.5843137255, blue: 0.3568627451, alpha: 1).withAlphaComponent(0.07)
            cell.notifcationLabel.text! = "Hello Ragahd, Welcome To Yasser"
            cell.notifcationTitleLabel.isHidden = true
            cell.notifcationLabel.textColor = .black
            cell.notifcationLabel.textAlignment = .left
        } else if indexPath.section == 1 {
            cell.notifcationLabel.text! = lableString[indexPath.row]
        } else {
            cell.notifcationLabel.text! =  labelStringSectionThree[indexPath.row]
        }
        
        return cell
       }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let label = UILabel()
            label.text = "  Today"
            label.font = UIFont(name: "AvenirNextLTPro-Regular", size: 12)
            label.textColor = .gray
            return label
        }else if section == 2 {
           let label = UILabel()
           label.text = "  22 April"
           label.font = UIFont(name: "AvenirNextLTPro-Regular", size: 12)
           label.textColor = .gray
           return label
        }
        
        else {
           let label = UILabel()
           label.text = "  23 April"
           label.font = UIFont(name: "AvenirNextLTPro-Regular", size: 12)
           label.textColor = .gray
           return label
        }
    }
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         let cell = notificationTableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        if indexPath.section == 1 {
            cell.roundedView.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.5843137255, blue: 0.3568627451, alpha: 1).withAlphaComponent(0.7)
        }
    }
       
    


}
