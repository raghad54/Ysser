//
//  TTabBarViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/20/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit
//
//  TTabBarViewController.swift
//  Hajij
//
//  Created by Raghad'Mac on 3/25/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit


extension UIImage{
    //Draws the top indicator by making image with filling color
    class func drawTabBarIndicator(size: CGSize, onTop: Bool) -> UIImage {
        let indicatorHeight = size.height / 30
        let yPosition = onTop ? 0 : (size.height - indicatorHeight)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        color.setFill()
        UIRectFill(CGRect(x: 50, y: yPosition, width: 30, height: indicatorHeight))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

/**
 Custom UITabBarController class which draw line indicator
 with custom color above or below the selected tab bar item using
 selectionIndicatorImage property on the UITabBar class
 **/
@IBDesignable class TTabBarViewController: UITabBarController, UITabBarControllerDelegate{
    /*
     //        color of the indicator
     //     */
    //    @IBInspectable var indicatorColor: UIColor = UIColor()
    //
    /*
     determine if the indicator
     will be drawn on top of bar items or not
     */
    @IBInspectable var onTopIndicator: Bool = true


    //MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        self.delegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        
    }
//
//func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//
//
//    let finalView  = self.viewControllers![0] as! HomeViewController
//        print(finalView)
//
//    // here, you should edit "0" to be matched with your selected item
//    // for instance, if there is 5 items and the desired item is in the middle, the compared value should be "2"
//    if tabBarController.selectedIndex == 4 {
//
//        let scanViewController = self.storyboard?.instantiateViewController(withIdentifier: "QRScanViewController") as! QRScanViewController
//            scanViewController.modalPresentationStyle = .overFullScreen
//           // scanViewController.modalTransitionStyle = .crossDissolve
//         //   scanViewController.definesPresentationContext = true
//            tabBarController.present(scanViewController, animated: true, completion: nil)
//
//    }
//}

    
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Draw Indicator above the tab bar items
        guard let numberOfTabs = tabBar.items?.count else {
            return
        }
        
        _ = CGFloat(numberOfTabs)
        let imageSize = CGSize(width: 26, height: 30)
        //    CGSize(width: tabBar.frame.width / numberOfTabsFloat,
                              // height: tabBar.frame.height)
        
        
        let indicatorImage = UIImage.drawTabBarIndicator(
            size: imageSize,
            onTop: onTopIndicator)
        self.tabBar.selectionIndicatorImage = indicatorImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    
    
    
}


