//
//  HomeSecondtViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/25/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class HomeSecondtViewController: UIViewController {
    
    @IBOutlet weak var confirmedState: UILabel!
    @IBOutlet weak var deathState: UILabel!
    @IBOutlet weak var recoveredState: UILabel!
    @IBOutlet weak var activeState: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getworlWideState()
    }
    
    func getworlWideState(){
        HomeRouter.fetchHomeAllCasess { (response, error) in
                 if let value = response {
                    let valueArray = value
                
                  
                    for (data) in valueArray {
                        let key = data.key  //key value which is colour or fabric
                           let value = data.value //value which would be moss green or cotton
                        if key == "cases"{
                            let intValue = Int(data.value)
                            let numberFormatter = NumberFormatter()
                            numberFormatter.numberStyle = .decimal
                            let formattedNumber = numberFormatter.string(from: NSNumber(value:intValue))
                            self.confirmedState.text! = formattedNumber ?? String(intValue)

                        } else if key == "deaths"{
                            
                           let intValue = Int(data.value)
                           let numberFormatter = NumberFormatter()
                           numberFormatter.numberStyle = .decimal
                           let formattedNumber = numberFormatter.string(from: NSNumber(value:intValue))
                           self.deathState.text! = formattedNumber ?? String(intValue)

                        }else if key == "recovered"{
                            let intValue = Int(data.value)
                            let numberFormatter = NumberFormatter()
                            numberFormatter.numberStyle = .decimal
                            let formattedNumber = numberFormatter.string(from: NSNumber(value:intValue))
                            self.recoveredState.text! = formattedNumber ?? String(intValue)

                        }else if key == "active"{
                        let intValue = Int(data.value)
                           let numberFormatter = NumberFormatter()
                           numberFormatter.numberStyle = .decimal
                           let formattedNumber = numberFormatter.string(from: NSNumber(value:intValue))
                           self.activeState.text! = formattedNumber ?? String(intValue)

                        }

                        
                            
                    }
//                   self.recoveredState.text! = String(value.recovered)
//                   self.activeState.text! = String(value.active)
                 }
             }

       }

}
