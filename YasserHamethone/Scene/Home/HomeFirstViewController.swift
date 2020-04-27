//
//  HomeFirstViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/25/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class HomeFirstViewController: UIViewController {
    
    @IBOutlet weak var confirmedState: UILabel!
    @IBOutlet weak var deathState: UILabel!
    @IBOutlet weak var recoveredState: UILabel!
    @IBOutlet weak var activeState: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getKsaState()
    }
    

   func getKsaState(){
          HomeRouter.fetchHome { (response, error) in
              if let value = response {
                  print(value.cases)
                
                let CasesIntValue = Int(value.cases)
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let formattedNumber = numberFormatter.string(from: NSNumber(value:CasesIntValue))
                self.confirmedState.text! = formattedNumber ?? String(CasesIntValue)
                
                let deathIntValue = Int(value.deaths)
                let formatterNumberForDeath = numberFormatter.string(from: NSNumber(value:deathIntValue))
                self.deathState.text! = formatterNumberForDeath ?? String(value.deaths)
                
                
                let recovredIntValue = Int(value.recovered)
                let formatterNumberForRecovred = numberFormatter.string(from: NSNumber(value:recovredIntValue))
                self.recoveredState.text! = formatterNumberForRecovred ?? String(value.recovered)
                
                let activeIntValue = Int(value.active)
                let formatterNumberForActive = numberFormatter.string(from: NSNumber(value:activeIntValue))
                self.activeState.text! = formatterNumberForActive ?? String(value.active)
              }
          }

    }
}
