//
//  DesinableTextView.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/21/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesinableTextView: UITextField {

    @IBInspectable var leftImage : UIImage?{
        didSet{
            updatView()
        }
    }
    @IBInspectable var leftPading : CGFloat =  0 {
        didSet{
            updatView()
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 2.7 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var placeHolderColor : UIColor? {
        didSet{
            if let p = placeholder{
                let place = NSAttributedString(string: p, attributes: [.foregroundColor : placeHolderColor!])
                attributedPlaceholder = place
            }
    }
}
    
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    //########************************************************************************************
    
    func updatView()  {
        
    
        
        if let image = leftImage {
            //to show image in the left
            leftViewMode = .always
            // define image as image view to show it in the left view
            //make x equal left pading to  make space between the frame and the image
            let imageView = UIImageView(frame: CGRect(x: leftPading, y: 0, width: 20, height: 20))
            imageView.image = image
          //  imageView.tintColor = tintColor
            // to make space betwwen the image and the text
            // to make the space between the image and the text make width more than imageWidth plus 20
            var width = leftPading + 20 // 20 mean the fixed width wich i detect it above
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width = width + 10
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            leftView = view
        }else{
            leftViewMode = .never
        }
    }
}

extension UIView {
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}


extension UINavigationController {
    
    func getViewControllerFromnavigationStack(viewController: Swift.AnyClass) ->  UIViewController?{
        
        for element in viewControllers as Array {
            if element.isKind(of: viewController) {
                
                return element
            }
        }
        return nil
    }
}

extension UIViewController{
    var previousViewController:UIViewController?{
        if let controllersOnNavStack = self.navigationController?.viewControllers{
            let n = controllersOnNavStack.count
            //if self is still on Navigation stack
            if controllersOnNavStack.last === self, n > 1{
                return controllersOnNavStack[n - 2]
            }else if n > 0{
                return controllersOnNavStack[n - 1]
            }
        }
        return nil
    }
}
