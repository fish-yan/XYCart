//
//  ViewController.swift
//  XYCart
//
//  Created by 薛焱 on 16/4/20.
//  Copyright © 2016年 薛焱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cartView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建carView
        cartView = UIView(frame: CGRect(x: 0, y: UIScreen.mainScreen().bounds.size.height, width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.height/2))
        cartView.backgroundColor = UIColor.cyanColor()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func present(sender: UIButton) {
        //在需要的时候调出你的cartView
        persentToCartView(cartView)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //在需要的时候让cartView消失
        dismissCartView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

