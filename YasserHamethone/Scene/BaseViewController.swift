//
//  BaseViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/22/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
              if #available(iOS 13.0, *) {
                  // Always adopt a light interface style.
                  overrideUserInterfaceStyle = .light
              }
              // Do any additional setup after loading the view.
              
        // Do any additional setup after loading the view.
    }
    
    
    func showBanner (title: String, subtitle:String,color:UIColor,warning:Bool = false , handler: @escaping (Bool) -> Void = { _ in }) {
          
          
          let image = warning ? #imageLiteral(resourceName: "warning") :#imageLiteral(resourceName: "Logo")
          let banner = Banner(title: title , subtitle: subtitle, image: image, backgroundColor: color)
          banner.textColor = UIColor.black
          banner.dismissesOnTap = true
          handler(true)
          banner.show(duration: 3.0)
      }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
