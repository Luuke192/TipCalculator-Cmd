//
//  input.swift
//  TipCalc-LL
//
//  Created by Lucas Lell on 10/10/16.
//  Copyright © 2016 Luuke192. All rights reserved.
//

import Foundation

class Input {
    // Valid input variables
    private var billAmountDone: Bool = false
    private var tipPercentDone: Bool = false
    private var numberOfPeopleDone: Bool = false
    // Input variables
    private var billAmount: String = ""
    private var tipPercent: String = ""
    private var numberOfPeople: String = ""
    
    func getBillAmount () {
        print("How much is your bill?")
        billAmount = readLine()!
        
        while billAmountDone == false {
        
            if billAmount != "" {
                print("Your bill amount is $\(billAmount).\n")
                billAmountDone = true
            } else {
                print("Invalid bill!")
                return
            }
        }
    }
    func getTipPercent () {
        print("How much would you like to tip?")
        tipPercent = readLine()!
        
        while tipPercentDone == false {
            
            if tipPercent != "" {
                print("You would like to give a \(tipPercent)% tip.\n")
                tipPercentDone = true
            } else {
                print("Invalid tip!")
                return
            }
        }
    }
    func getNumberOfPeople () {
        print("How many people are on the bill?")
        numberOfPeople = readLine()!
        
        while numberOfPeopleDone == false {
            
            if numberOfPeople != "" {
                print("There are \(numberOfPeople) on the bill.\n")
                tipPercentDone = true
            } else {
                print("Invalid number of people!")
                return
            }
        }
    }

}
