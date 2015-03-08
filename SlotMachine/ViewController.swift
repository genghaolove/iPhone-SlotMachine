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
    var firstContainer, secondContainer, thirdContainer, fourthContainer: UIView!
    
    // Constants
    let marginForView: CGFloat = 10.0
    let marginForSlot:CGFloat = 2.0
    let oneSixth: CGFloat = 1.0/6.0
    let oneThird: CGFloat = 1.0/3.0
    let numberOfSlots = 3
    let numberOfContainersPerSlot = 3
    
    var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Views will be drawn
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupContainerViews() {
        
        // Four different views will represent four parts of the screen
        
        self.firstContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + marginForView, self.view.bounds.origin.y, self.view.bounds.width - (marginForView * 2), self.view.bounds.height * oneSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + marginForView, firstContainer.frame.height, self.view.bounds.width - (marginForView * 2), self.view.bounds.height * (oneSixth * 3)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + marginForView, firstContainer.frame.height + secondContainer.frame.height, self.view.bounds.width - (marginForView * 2), self.view.bounds.height * oneSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + marginForView, firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, self.view.bounds.width - (marginForView * 2), self.view.bounds.height * oneSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }
    
    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Slot Machine"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(containerView: UIView) {
        
        // Sets nine fields, 3 per slot
        for containerNumber in 0..<numberOfContainersPerSlot {
            for slotNumber in 0..<numberOfSlots {
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRectMake(
                    containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * oneThird),
                    containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * oneThird),
                    containerView.bounds.width * oneThird - marginForSlot,
                    containerView.bounds.height * oneThird - marginForSlot
                )
                
                containerView.addSubview(slotImageView)
            }
        }
    }
}

