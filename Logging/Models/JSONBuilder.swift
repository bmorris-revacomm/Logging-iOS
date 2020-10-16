//
//  JSONBuilder.swift
//  Logging
//
//  Created by Pete Misik on 10/15/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

class JSONBuilder {
    var spacer: String = "     "

    func startOfFile() -> String {
        return "[\n"
    }
    func endOfFile() -> String {
        return "]"
    }
    func startOfObject(level: Int) -> String {
        if level > 1 {
            for _ in 1...level {
                spacer += spacer
            }
            return spacer + "{\n"
        } else {
            return spacer + "{\n"
        }
    }

    func addObject(level: Int, key: String, value: String, anotherValue: Bool) -> String {
        let lclLevel: Int = level + 1
        let lclKey: String = self.encapsulate(item: key)
        let lclVal: String  = self.encapsulate(item: value)
        var lclSpacer = ""
        for _ in 1...lclLevel {
            lclSpacer += spacer
        }
        if anotherValue{
            return "\(lclSpacer)\(lclKey):\(lclVal),\n"
        }else{
        return "\(lclSpacer)\(lclKey):\(lclVal)\n"
        }
    }

    func endOfObject(level: Int, anotherObject: Bool) -> String {
        if level > 1 {
            for _ in 1...level {
                spacer += spacer
            }
            if anotherObject{
                return spacer + "},\n"
            }
            else {
                return spacer + "}\n"
            }
        } else if anotherObject{
            return spacer + "},\n"
        } else {
            return spacer + "}\n"
        }
    }
    func encapsulate(item: String) -> String {
        return "\"\(item)\""
    }
    
    func validateJSON(input: String) -> Bool {
        let jsonData = input.data(using: String.Encoding.utf8)
        
        if JSONSerialization.isValidJSONObject(jsonData ?? "{}") {
            return true
        }
        else {
            return false
        }
    }

}
