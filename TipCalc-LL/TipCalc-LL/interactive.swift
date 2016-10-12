//
//  input.swift
//  TipCalc-LL
//
//  Created by Lucas Lell on 10/10/16.
//  Copyright © 2016 Luuke192. All rights reserved.
//

import Foundation

func writeHelpMenu() {
    let io = inputOutput()
    
    io.writeMessage("\n-- Help Menu --\n")
    io.writeMessage("If at any time using the calculator, feel free to use the Help command!\n")
    io.writeMessage("Proper use of the Tip Calculator")
    io.writeMessage("--------------------------------")
    io.writeMessage("1.) Enter your bill amount with numbers and one period. This does not require a currency character.")
    io.writeMessage("2.) Enter a percentage of your bill that you would like to tip from 1-100. This does not require the '%' character.")
    io.writeMessage("3.) Enter how many people will share the bill. This needs to be in number format.")
    io.writeMessage("4.) Your bill total with the tip will then be shown. The program will then start at the main menu again.\n")
} // Help Menu Text

class Interactive {
    private var done: Bool = false
    private var currentInput: String = ""
    private let io = inputOutput()
    private let tipCalc = Calculator()
    
    func go() {
        while !done {
            // Main menu screen
            io.writeMessage("!!ALL COMMAND ENTRIES ARE FOLLOWED BY THE RETURN KEY!!\n")
            io.writeMessage("---- Luke's Tip Calculator ----")
            io.writeMessage("Enter 'C' to calculate your bill/tip total!")
            io.writeMessage("Enter 'H' for help.")
            io.writeMessage("Enter 'Q' to quit.\n")
            currentInput = io.getInput()
            
            // User command directions
            if currentInput == "Q" || currentInput == "q" {
                done = true
            } else if currentInput == "H" || currentInput == "h" {
                writeHelpMenu()
            } else if currentInput == "C" || currentInput == "c" {
                tipCalc.calculateTip()
            } else {
                print("'\(currentInput)' is not a vaild command!")
            }
        }
        print("\nExiting... Goodbye!")
        
        return
    }
    
} // Menu Functions

class Calculator {
    
    private var billTotal: Double = 0
    private var numberOfPeople: Int = 1
    private var tipPercentage: Double = 1
    var validInput = false
    
    private let io = inputOutput()
    
    func getBillTotal() {
        
        validInput = false // Set input to false
        
        while validInput == false { // Validate Input
            
            print("\nPlease enter your bill total without your currency symbol and press Return when you are done:\n ") // Prompt Instructions
            
            let inputVal = io.getInput() // Take console value from user
            
            if inputVal.characters.count > 0 { // Check for blank input
                let billString = inputVal // Set new Constant to current inputVal
                if let billNum = Double(billString) { // Check billNum for invalid characters and if valid make it a Double()
                    if billNum > 0 { // Make sure billTotal will not be a negative number
                        billTotal = billNum // Set billTotal to the valid number
                        validInput = true // Exit loop with valid input
                    } else {
                        print("Value entered is less than or equal to zero. Try again or type 'H' for help!") // Negative number error catch
                    }
                } else if inputVal == "H" || inputVal == "h" {
                    writeHelpMenu() // Check for Help command
                } else {
                    print("Please make sure to only use numbers. Also only one decimal is allowed. Try again or type 'H' for help!") // billNum value check threw an error.
                }
            } else {
                print("Try typing something this time! Try again or type 'H' for help!") // User didn't enter anything.
            }
        }
    } // Get users total bill
    
    func getTipPercentage() {
        
        validInput = false // Set input to false
        
        while validInput == false { // Validate input
            
            print("\nEnter a percentage of your bill total that you'd like to give as a tip. Numbers 1-100 are valid tips:\n ") // Prompt instructions
            
            let inputVal = io.getInput() // Take user input
            
            if inputVal.characters.count > 0 { // Check for blank input
                let tipString = inputVal // Set tipString to the user input
                if let tipInt = Int(tipString) { // Check for a valid integer
                    if tipInt > 1 && tipInt <= 100 { // Check for valid percent range
                        tipPercentage = Double(tipInt)/Double(100) // Set tipPercentage to tipInt as a Double value then make it usable as a percentage
                        validInput = true // End loop
                    } else {
                        print("Percentage entered is not between 1-100.  Try again or type 'H' for help!") // Range error check
                    }
                } else if inputVal == "H" || inputVal == "h" {
                    writeHelpMenu() // Help menu command check
                } else {
                    print("Not a number! Try again or type 'H' for help!") // Error for invalid Int
                }
            } else {
                print("Try to type something this time!. Try again or type 'H' for help!") // Error for no input
            }
        }
    } // Get tip percentage amount
    
    func getNumberOfPeople() {
        
        validInput = false // Set input to false
        
        while validInput == false { // Validate input
            
            print("\nPlease enter the number of people who will be splitting the bill:\n ") // Prompt Instructions
            
            let inputVal = io.getInput() // Set user input to a constant
            
            if inputVal.characters.count > 0 { // Check for blank input
                let numOfPeopleString = inputVal // Set input value to another constant
                if let numOfPeople = Int(numOfPeopleString) { // Check if input is a valid Int
                    if numOfPeople >= 1 { // Check that theres at least 1 person
                        numberOfPeople = numOfPeople // Set the value
                        validInput = true
                    } else {
                        print("Please only use numbers above 1! Try again or type 'H' for help!") // Wrong Int value error
                    }
                } else if inputVal == "h" || inputVal == "H" {
                    writeHelpMenu() // Help command check
                } else {
                    print("Only use numbers please! Try again or type 'H' for help!") // Totally wrong value type
                }
            } else {
                print("Type something next time! Try again or type 'H' for help!")
            }
        }
    } // Check number of People on bill
    
    func calculateTip() {
        getBillTotal()
        getTipPercentage()
        getNumberOfPeople()
        if numberOfPeople == 1 {
            let singleTip = billTotal * tipPercentage
            let singleTotal = singleTip + billTotal
            print("\nYou're going to tip $\(round(100 * singleTip)/100)\n")
            print("Your final bill is going to be $\(round(100 * singleTotal)/100)\n")
        } else {
            let moreThanOneTip = (billTotal * tipPercentage)/Double(numberOfPeople)
            let moreThanOneTotal = ((billTotal * tipPercentage) + billTotal)/Double(numberOfPeople)
            print("\nEach person will need to tip $\(round(100 * moreThanOneTip)/100).\n")
            print("Each person will pay $\(round(100 * moreThanOneTotal)/100). Tip is included.\n")
        }
    } // Math stuff
    
} // Backend Calculations
