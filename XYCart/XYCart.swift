//
//  XYCart.swift
//  XYCart
//
//  Created by 薛焱 on 16/4/20.
//  Copyright © 2016年 薛焱. All rights reserved.
//

import UIKit

extension ViewController {
    /**
     弹出视图
     
     - parameter cartView: 需要弹出的视图
     */
    func persentToCartView(cartView: UIView) {
        cartView.tag = 757094197
        var rect = cartView.frame
        rect.origin.y = UIScreen.mainScreen().bounds.size.height - rect.size.height
        let currentWindow = UIApplication.sharedApplication().windows[0]
        let maskView = UIView(frame: currentWindow.bounds)
        maskView.backgroundColor = UIColor.blackColor()
        maskView.tag = 7777777
        maskView.alpha = 0.0
        view.addSubview(maskView)
        UIView.animateWithDuration(0.3, animations: {
            self.view.layer.transform = self.firstTran()
            maskView.alpha = 0.5
        }) { (finish: Bool) in
            UIView.animateWithDuration(0.3, animations: {
                self.view.layer.transform = self.secondTran()
                cartView.frame = rect
                currentWindow.addSubview(cartView)
                }, completion:nil)
        }
    }
   
    /**
     视图消失
     */
    func dismissCartView() {
        let currentWindow = UIApplication.sharedApplication().windows[0]
        if currentWindow.viewWithTag(757094197) == nil {
            return
        }
        let cartView: UIView = currentWindow.viewWithTag(757094197)!
        let maskView: UIView = view.viewWithTag(7777777)!

        var rect = cartView.frame
        rect.origin.y = UIScreen.mainScreen().bounds.size.height
        UIView.animateWithDuration(0.3, animations: {
            self.view.layer.transform = self.firstTran()
            cartView.frame = rect
            
        }) { (finish: Bool) in
            cartView.removeFromSuperview()
            UIView.animateWithDuration(0.3, animations: {
                maskView.alpha = 0.0
                self.view.layer.transform = CATransform3DIdentity
                }, completion: {(finish: Bool) in
                    maskView.removeFromSuperview()
            })
        }
    }
    
    private func firstTran() -> CATransform3D {
        var transform = CATransform3DIdentity
        transform.m24 = -1/2000
        transform = CATransform3DScale(transform, 0.9, 0.9, 1)
        return transform
    }
    
    private func secondTran() -> CATransform3D {
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, self.view.frame.size.height * (-0.05), 0)
        transform = CATransform3DScale(transform, 0.9, 0.9, 1)
        return transform
    }
}