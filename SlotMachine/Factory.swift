//
//  Factory.swift
//  SlotMachine
//
//  Created by Hrvoje Baic on 14/03/15.
//  Copyright (c) 2015 Hrvoje Baic. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    
    class func createSlots() -> [[Slot]] {
        let numberOfSlots = 3
        let numberOfContainers = 3
        
        var slots: [[Slot]] = []
        
        for containerNumber in 0..<numberOfContainers {
            var slotArray: [Slot] = []
            
            for slotNumber in 0..<numberOfSlots {
                
                var slot = Factory.createSlot(slotArray)
                
                slotArray.append(slot)
            }
            
            slots.append(slotArray)
        }
        
        return slots
    }
    
    class func createSlot(currentCards: [Slot]) -> Slot {
        var currentCardValues: [Int] = []
        
        for slot in currentCards {
            currentCardValues.append(slot.value)
        }
        
        var randomNumber = Int(arc4random_uniform(UInt32(13)))
        
        while contains(currentCardValues, randomNumber) {
            randomNumber = Int(arc4random_uniform(UInt32(13)))
        }
        
        var slot: Slot
        switch randomNumber {
        case 0:
            slot = Slot(value: 1, image: UIImage(named: "Ace")!, isRed: true)
        case 1:
            slot = Slot(value: 2, image: UIImage(named: "Two")!, isRed: true)
        case 2:
            slot = Slot(value: 3, image: UIImage(named: "Three")!, isRed: true)
        case 3:
            slot = Slot(value: 4, image: UIImage(named: "Four")!, isRed: true)
        case 4:
            slot = Slot(value: 5, image: UIImage(named: "Five")!, isRed: true)
        case 5:
            slot = Slot(value: 6, image: UIImage(named: "Six")!, isRed: true)
        case 6:
            slot = Slot(value: 7, image: UIImage(named: "Seven")!, isRed: true)
        case 7:
            slot = Slot(value: 8, image: UIImage(named: "Eight")!, isRed: true)
        case 8:
            slot = Slot(value: 9, image: UIImage(named: "Nine")!, isRed: true)
        case 9:
            slot = Slot(value: 10, image: UIImage(named: "Ten")!, isRed: true)
        case 10:
            slot = Slot(value: 11, image: UIImage(named: "Jack")!, isRed: true)
        case 11:
            slot = Slot(value: 12, image: UIImage(named: "Queen")!, isRed: true)
        case 12:
            slot = Slot(value: 13, image: UIImage(named: "King")!, isRed: true)
        default:
            slot = Slot(value: 1, image: UIImage(named: "Ace")!, isRed: true)
        }
        
        return slot
    }
}






















