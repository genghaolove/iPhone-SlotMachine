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
    let oneHalf: CGFloat = 1.0/2.0
    let oneEighth: CGFloat = 1.0/8.0
    
    let numberOfSlots = 3
    let numberOfContainersPerSlot = 3
    
    // Labels
    var titleLabel: UILabel!
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLabel: UILabel!
    
    // Buttons
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var betMaxButton: UIButton!
    var spinButton: UIButton!
    
    // Slots array
    var slots: [[Slot]] = []
    
    // Stats
    var credits: Int = 0
    var currentBet: Int = 0
    var winnings: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Views will be drawn
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
        
        hardReset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupContainerViews() {
        // Four different views will represent four parts of the screen
        
        self.firstContainer = UIView(
            frame: CGRectMake(
                self.view.bounds.origin.x + marginForView,
                self.view.bounds.origin.y,
                self.view.bounds.width - (marginForView * 2),
                self.view.bounds.height * oneSixth
            )
        )
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(
            frame: CGRectMake(
                self.view.bounds.origin.x + marginForView,
                firstContainer.frame.height,
                self.view.bounds.width - (marginForView * 2),
                self.view.bounds.height * (oneSixth * 3)
            )
        )
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(
            frame: CGRectMake(
                self.view.bounds.origin.x + marginForView,
                firstContainer.frame.height + secondContainer.frame.height,
                self.view.bounds.width - (marginForView * 2),
                self.view.bounds.height * oneSixth
            )
        )
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(
            frame: CGRectMake(
                self.view.bounds.origin.x + marginForView,
                firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height,
                self.view.bounds.width - (marginForView * 2),
                self.view.bounds.height * oneSixth
            )
        )
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }
    
    // First container holds the title
    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Slot Machine"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        
        containerView.addSubview(self.titleLabel)
    }
    
    // Second container holds the slots
    func setupSecondContainer(containerView: UIView) {
        // Sets nine fields, 3 per slot
        for containerNumber in 0..<numberOfContainersPerSlot {
            for slotNumber in 0..<numberOfSlots {
                
                var slot: Slot
                var slotImageView = UIImageView()
                
                if slots.count != 0 {
                    let slotContainer = slots[containerNumber]
                    slot = slotContainer[slotNumber]
                    slotImageView.image = slot.image
                }
                else {
                    slotImageView.image = UIImage(named: "ace_of_hearts")
                }
                
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRectMake(
                    containerView.bounds.origin.x +
                        (containerView.bounds.size.width * CGFloat(containerNumber) * oneThird),
                    containerView.bounds.origin.y +
                        (containerView.bounds.size.height * CGFloat(slotNumber) * oneThird),
                    containerView.bounds.width * oneThird - marginForSlot,
                    containerView.bounds.height * oneThird - marginForSlot
                )
                
                containerView.addSubview(slotImageView)
            }
        }
    }
    
    // Third container holds Credits, current bet and total amount paid to player
    func setupThirdContainer(containerView: UIView) {
        
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPointMake(
            containerView.frame.width * oneSixth,
            containerView.frame.height * oneThird
        )
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.creditsLabel)
        
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPointMake(
            containerView.frame.width * oneSixth * 3,
            containerView.frame.height * oneThird
        )
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betLabel)
        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPointMake(
            containerView.frame.width * oneSixth * 5,
            containerView.frame.height * oneThird
        )
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winnerPaidLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPointMake(
            containerView.frame.width * oneSixth,
            containerView.frame.height * oneThird * 2
        )
        containerView.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPointMake(
            containerView.frame.width * oneSixth * 3,
            containerView.frame.height * oneThird * 2
        )
        containerView.addSubview(self.betTitleLabel)
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "Winner Paid"
        self.winnerPaidTitleLabel.textColor = UIColor.blackColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPointMake(
            containerView.frame.width * oneSixth * 5,
            containerView.frame.height * oneThird * 2
        )
        containerView.addSubview(self.winnerPaidTitleLabel)
    }
    
    // Fourth container holds buttons
    func setupFourthContainer(containerView: UIView) {
        
        // Setting reset button's properties
        self.resetButton = UIButton()
        self.resetButton.setTitle("Reset", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.resetButton.backgroundColor = UIColor.lightGrayColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPointMake(
            containerView.frame.width * oneEighth,
            containerView.frame.height * oneHalf
        )
        // Setting reset button's action
        self.resetButton.addTarget(
            self,
            action: "resetButtonPressed:",
            forControlEvents: UIControlEvents.TouchUpInside
        )
        containerView.addSubview(self.resetButton)
        
        // Setting a button for betting one credit
        self.betOneButton = UIButton()
        self.betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.betOneButton.backgroundColor = UIColor.greenColor()
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPointMake(
            containerView.frame.width * oneEighth * 3,
            containerView.frame.height * oneHalf
        )
        //Setting bet one button's action
        self.betOneButton.addTarget(
            self,
            action: "betOneButtonPressed:",
            forControlEvents: UIControlEvents.TouchUpInside
        )
        containerView.addSubview(self.betOneButton)
        
        // Setting a button for betting max (5)
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle("Bet Max", forState: UIControlState.Normal)
        self.betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.betMaxButton.backgroundColor = UIColor.greenColor()
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPointMake(
            containerView.frame.width * oneEighth * 5,
            containerView.frame.height * oneHalf
        )
        // Setting bet max button's action
        self.betMaxButton.addTarget(
            self,
            action: "betMaxButtonPressed:",
            forControlEvents: UIControlEvents.TouchUpInside
        )
        containerView.addSubview(self.betMaxButton)
        
        self.spinButton = UIButton()
        self.spinButton.setTitle("Spin", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.spinButton.backgroundColor = UIColor.orangeColor()
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPointMake(
            containerView.frame.width * oneEighth * 7,
            containerView.frame.height * oneHalf
        )
        // Setting spin button's action
        self.spinButton.addTarget(
            self,
            action: "spinButtonPressed:",
            forControlEvents: UIControlEvents.TouchUpInside
        )
        containerView.addSubview(self.spinButton)
    }
    
    // IBActions
    func resetButtonPressed(sender: UIButton) {
        
        // Debug
        // println("reset button pressed")
        
        hardReset()
    }
    
    func betOneButtonPressed(sender: UIButton) {
        
        // Debug
        // println("bet one button pressed")
        
        if credits <= 0 {
            showAlertWithText(header: "No more credits!", message: "Reset!")
        }
        else {
            if currentBet < 5 {
                currentBet += 1
                credits -= 1
                updateMainView()
            }
            else {
                showAlertWithText(message: "Max bet is 5!")
            }
        }
    }
    
    func betMaxButtonPressed(sender: UIButton) {
        
        // Debug
        // println("bet max button pressed")
    }
    
    func spinButtonPressed(sender: UIButton) {
        
        // Debug
        //println("spin button pressed")
        
        // Remove views so they don't stack on each other
        removeSlotImageViews()
        
        slots = Factory.createSlots()
        setupSecondContainer(self.secondContainer)
    }
    
    // Helpers
    func removeSlotImageViews() {
        if self.secondContainer != nil {
            let container: UIView? = self.secondContainer!
            
            let subViews: Array? = container!.subviews
            for view in subViews! {
                view.removeFromSuperview()
            }
        }
    }
    
    func hardReset() {
        removeSlotImageViews()
        slots.removeAll(keepCapacity: true)
        self.setupSecondContainer(self.secondContainer)
        
        credits = 50
        winnings = 0
        currentBet = 0
        
        updateMainView()
    }
    
    func updateMainView() {
        self.creditsLabel.text = "\(credits)"
        self.betLabel.text = "\(currentBet)"
        self.winnerPaidLabel.text = "\(winnings)"
    }
    
    func showAlertWithText(header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}














