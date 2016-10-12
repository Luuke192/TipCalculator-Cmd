//
//  io.swift
//  TipCalc-LL
//
//  Created by Lucas Lell on 10/10/16.
//  Copyright © 2016 Luuke192. All rights reserved.
//

import Foundation

class inputOutput {
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let str = NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)
        if let string = str {
            return string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        } else {
            return "Invalid input!"
        }
    }
    
    func writeMessage(_ message: String) {
        print("\(message)")
    }
}
