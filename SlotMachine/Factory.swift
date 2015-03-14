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
            slot = Slot(value: 1, image: UIImage(named: "ace_of_hearts")!, isRed: true)
        case 1:
            slot = Slot(value: 2, image: UIImage(named: "2_of_hearts")!, isRed: true)
        case 2:
            slot = Slot(value: 3, image: UIImage(named: "3_of_clubs")!, isRed: false)
        case 3:
            slot = Slot(value: 4, image: UIImage(named: "4_of_hearts")!, isRed: true)
        case 4:
            slot = Slot(value: 5, image: UIImage(named: "5_of_clubs")!, isRed: false)
        case 5:
            slot = Slot(value: 6, image: UIImage(named: "6_of_clubs")!, isRed: false)
        case 6:
            slot = Slot(value: 7, image: UIImage(named: "7_of_hearts")!, isRed: true)
        case 7:
            slot = Slot(value: 8, image: UIImage(named: "8_of_clubs")!, isRed: false)
        case 8:
            slot = Slot(value: 9, image: UIImage(named: "9_of_hearts")!, isRed: true)
        case 9:
            slot = Slot(value: 10, image: UIImage(named: "10_of_hearts")!, isRed: true)
        case 10:
            slot = Slot(value: 11, image: UIImage(named: "jack_of_hearts2")!, isRed: true)
        case 11:
            slot = Slot(value: 12, image: UIImage(named: "queen_of_clubs2")!, isRed: false)
        case 12:
            slot = Slot(value: 13, image: UIImage(named: "king_of_hearts2")!, isRed: true)
        default:
            slot = Slot(value: 1, image: UIImage(named: "ace_of_hearts")!, isRed: true)
        }
        
        return slot
    }
}






















