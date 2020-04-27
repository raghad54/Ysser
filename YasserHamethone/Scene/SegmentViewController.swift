//
//  SegmentViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/23/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit
import BetterSegmentedControl

class SegmentViewController: UIViewController {

    @IBOutlet weak var galleryControl: BetterSegmentedControl!
    @IBOutlet weak var segmentViewContainer: UIView!
    @IBOutlet weak var galleryTitleLabel: UILabel!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           setUpPropertiesOfSegmentedControl()
       }
       
       
       override func viewWillAppear(_ animated: Bool) {
       }
       
       
       private func setUpPropertiesOfSegmentedControl() {
             galleryControl.layer.borderColor = #colorLiteral(red: 0.9490196078, green: 0.6901960784, blue: 0.1019607843, alpha: 1)
             galleryControl.layer.borderWidth = 2
             galleryControl.segments = LabelSegment.segments(withTitles:  ["Albums", "Photos"], numberOfLines: 1, normalBackgroundColor:.white, normalFont: UIFont(name: "NeoSansArabic", size: 16), normalTextColor:#colorLiteral(red: 0.9490196078, green: 0.6901960784, blue: 0.1019607843, alpha: 1), selectedBackgroundColor: #colorLiteral(red: 0.9490196078, green: 0.6901960784, blue: 0.1019607843, alpha: 1), selectedFont: UIFont(name: "NeoSansArabic", size: 16), selectedTextColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
             galleryControl.addTarget(self, action: #selector(updateView(sender:)), for: .valueChanged)
             add(asChildViewController: albumViewController)
             remove(asChildViewController: photosViewController)
             
         }

   //MARK:- FirstView
       private lazy var albumViewController: LocalViewController = {
              // Load Storyboard
              let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

              // Instantiate View Controller
              var viewController = storyboard.instantiateViewController(withIdentifier: "LocalViewController") as! LocalViewController
           
              // Add View Controller as Child View Controller
             self.add(asChildViewController: viewController)

              return viewController
          }()
       
   //MARK:- SecondView
          private lazy var photosViewController: GlobalViewController = {
              // Load Storyboard
              let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

              // Instantiate View Controller
              var viewController = storyboard.instantiateViewController(withIdentifier: "GlobalViewController") as! GlobalViewController
           
              // Add View Controller as Child View Controller
           self.add(asChildViewController: viewController)


              return viewController
          }()

       private func add(asChildViewController viewController: UIViewController) {

              // Add Child View Controller
           addChild(viewController)

              // Add Child View as Subview
              segmentViewContainer.addSubview(viewController.view)

              // Configure Child View
              viewController.view.frame = segmentViewContainer.bounds
              viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

              // Notify Child View Controller
           viewController.didMove(toParent: self)
          }

          //----------------------------------------------------------------

          private func remove(asChildViewController viewController: UIViewController) {
              // Notify Child View Controller
           viewController.willMove(toParent: nil)

              // Remove Child View From Superview
              viewController.view.removeFromSuperview()

              // Notify Child View Controller
           viewController.removeFromParent()
          }

          //----------------------------------------------------------------

       @objc func updateView(sender: BetterSegmentedControl) {
           print(sender.index)
          if sender.index == 0 {
               add(asChildViewController: albumViewController)
               remove(asChildViewController: photosViewController)
           } else {
               add(asChildViewController: photosViewController)
               remove(asChildViewController: albumViewController)
           }
          }
       
      

}
