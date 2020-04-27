//
//  HomeViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/20/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit
import BetterSegmentedControl

class HomeViewController: BaseViewController,UICollectionViewDelegate, UICollectionViewDataSource {


    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var infectedAreaCollectionView: UICollectionView!
    @IBOutlet weak var AttendanceControl: BetterSegmentedControl!
    @IBOutlet weak var segmentViewContainer: UIView!
    
    
    var cityArray = ["Riyadh", "Madinah", "Makkah", "Taif", "ALHassa", "Dammam"]
    var counterArray = ["11,123", "12,33", "33,44", "123,55", "11,44", "1000"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        logoImage.setRounded()
        setUpPropertiesOfSegmentedControl()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //getKsaState()
    }
    
    
    private func setUpPropertiesOfSegmentedControl() {
        AttendanceControl.layer.borderColor = #colorLiteral(red: 0.09803921569, green: 0.5843137255, blue: 0.3568627451, alpha: 1)
        AttendanceControl.layer.borderWidth = 2
        AttendanceControl.segments = LabelSegment.segments(withTitles:  ["KSA", "Global"], numberOfLines: 1, normalBackgroundColor:#colorLiteral(red: 0.09803921569, green: 0.5843137255, blue: 0.3568627451, alpha: 1), normalFont: UIFont(name: "AvenirNextLTPro-Demi ", size: 16), normalTextColor:.white, selectedBackgroundColor: .white, selectedFont: UIFont(name: "AvenirNextLTPro-Demi ", size: 16), selectedTextColor:#colorLiteral(red: 0.09803921569, green: 0.5843137255, blue: 0.3568627451, alpha: 1) )
              AttendanceControl.addTarget(self, action: #selector(updateView(sender:)), for: .valueChanged)
              add(asChildViewController: HomeFirstViewController)
        remove(asChildViewController: HomeSecondtViewController)
        
        AttendanceControl.layer.shadowColor = #colorLiteral(red: 0.9568627451, green: 0.9411764706, blue: 0.8901960784, alpha: 1)
        AttendanceControl.layer.shadowOpacity = 10
      //  AttendanceControl.layer.shadowOffset = CGSize.zero
      //  yourVAttendanceControliew.layer.shadowRadius = 6
                    
          }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = infectedAreaCollectionView.dequeueReusableCell(withReuseIdentifier: "infectedAreaCollectionViewCell", for: indexPath) as! infectedAreaCollectionViewCell
        cell.cityName.text! = cityArray[indexPath.row]
        cell.count.text! = counterArray[indexPath.row]
        if indexPath.row == 5 {
            cell.increasedImage.image = UIImage(named: "decresed")
        }
        return cell
    }


    //MARK:- FirstView
         private lazy var HomeFirstViewController: HomeFirstViewController = {
                // Load Storyboard
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

                // Instantiate View Controller
                var viewController = storyboard.instantiateViewController(withIdentifier: "HomeFirstViewController") as! HomeFirstViewController

                // Add View Controller as Child View Controller
               self.add(asChildViewController: viewController)

                return viewController
            }()
         
     //MARK:- SecondView
            private lazy var HomeSecondtViewController: HomeSecondtViewController = {
                // Load Storyboard
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

                // Instantiate View Controller
                var viewController = storyboard.instantiateViewController(withIdentifier: "HomeSecondtViewController") as! HomeSecondtViewController

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
            viewController.view.backgroundColor = .clear
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
                 add(asChildViewController: HomeFirstViewController)
                 remove(asChildViewController: HomeSecondtViewController)
             } else {
                 add(asChildViewController: HomeSecondtViewController)
                 remove(asChildViewController: HomeFirstViewController)
             }
            }
       
       
    func flexableCollectionViewSize(collectionView:UICollectionView,height:Int)
      {
          let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
          layout.itemSize = UICollectionViewFlowLayout.automaticSize
          var collectionViewLayout: CustomCellFlowLayout!
          collectionViewLayout = CustomCellFlowLayout()
          collectionViewLayout.cellsPerRow = 2
          collectionViewLayout.height = CGFloat(height)
          collectionView.collectionViewLayout = collectionViewLayout
      }
    
    
   
    }



extension UIImageView {

   func setRounded() {
    let radius = self.frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}




