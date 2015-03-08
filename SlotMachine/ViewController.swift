//
//  ViewController.swift
//  SlotMachine
//
//  Created by Hrvoje Baic on 08/03/15.
//  Copyright (c) 2015 Hrvoje Baic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Containers
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    let marginForView: CGFloat = 10.0
    let oneSixth: CGFloat = 1.0/6.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + marginForView, self.view.bounds.origin.y, self.view.bounds.width - (marginForView * 2), self.view.bounds.height * oneSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(self.firstContainer)
    }
}

