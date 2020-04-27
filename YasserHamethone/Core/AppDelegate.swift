//
//  AppDelegate.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/20/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import ARSLineProgress


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        ARSLineProgressConfiguration.backgroundViewStyle = .full
        ARSLineProgressConfiguration.backgroundViewColor = UIColor.clear.cgColor
        ARSLineProgressConfiguration.backgroundViewDismissTransformScale = 1
        ARSLineProgressConfiguration.successCircleLineWidth = 20
        ARSLineProgressConfiguration.circleColorInner =  #colorLiteral(red: 0.8941176471, green: 0.768627451, blue: 0.4862745098, alpha: 1)
        ARSLineProgressConfiguration.circleColorOuter =  #colorLiteral(red: 0.06216912717, green: 0.4684827924, blue: 0.2769854367, alpha: 1)
        ARSLineProgressConfiguration.circleColorMiddle =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        return true
    }
    
    func showBanner (title: String, subtitle:String,color:UIColor,warning:Bool = false) {
           
           let banner = Banner(title: title , subtitle: subtitle, image: UIImage(named: "logo"), backgroundColor: color)
           banner.textColor = #colorLiteral(red: 0.09803921569, green: 0.5843137255, blue: 0.3568627451, alpha: 1)
           banner.dismissesOnTap = true
           banner.show(duration: 5.0)
       }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        
        
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

