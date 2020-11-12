//
//  LoggingTests.swift
//  LoggingTests
//
//  Created by Christian Brechbuhl on 7/30/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import XCTest
@testable import Logging

class LoggingTests: XCTestCase {
    
    
    func testHelperFunction() {
        let date = Helper().populateDateField()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let testDate = dateFormatter.string(from: Date())
        
        XCTAssertEqual(date, testDate)
    }
    
    func testFileFound() {
       
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
        let url = path?.appendingPathComponent("Logging.json", isDirectory: false)
        let result = Helper().checkForFile(filePath: url!)
        XCTAssertTrue(result)
    }
    
    func testCheckInput() {
        let result = Helper().checkInput(time: "0900")
        XCTAssertTrue(result)
    }
    
    func testSeperateHours() {
        // Test requires input to have a colon
        let hrs = Helper().separateHoursAndMins(strInput: "10:00", pointer: "hour")
        XCTAssertEqual(hrs, "10")
    }
    
    func testSeperateMins() {
        // Test requires input to have a colon
        let min = Helper().separateHoursAndMins(strInput: "10:30", pointer: "min")
        XCTAssertEqual(min, "30")
    }
}//End
