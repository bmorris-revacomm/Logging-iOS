//
//  LoggingUITests.swift
//  LoggingUITests
//
//  Created by Christian Brechbuhl on 7/30/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import XCTest
@testable import Logging

class LoggingUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["YES"].tap()
        app.textFields["XX"].tap()
        app.textFields["00-0000"].tap()
        app.textFields["00 AB CDE FG"].tap()
        app.textFields["JOINT BASE CHARLESTON, SC 29404"].tap()
        app.textFields["00-XXXX"].tap()
        // app.alerts["Invalid Time"].scrollViews.otherElements.buttons["Okay"].tap()
        
        let textField = app.textFields["00 AA"]
        textField.tap()
        app/*@START_MENU_TOKEN@*/.tables.containing(.button, identifier:"add").element/*[[".tables.containing(.staticText, identifier:\"SPECIAL USE\").element",".tables.containing(.staticText, identifier:\"SORTIES\").element",".tables.containing(.staticText, identifier:\"TOTAL\").element",".tables.containing(.staticText, identifier:\"FULL STOP\").element",".tables.containing(.staticText, identifier:\"TOUCH & GO\").element",".tables.containing(.staticText, identifier:\"TOTAL TIME\").element",".tables.containing(.staticText, identifier:\"LAND TIME (Z)\").element",".tables.containing(.staticText, identifier:\"TAKE OFF TIME (Z)\").element",".tables.containing(.staticText, identifier:\"TO (ICAO)\").element",".tables.containing(.staticText, identifier:\"FROM (ICAO)\").element",".tables.containing(.staticText, identifier:\"MISSION SYMBOL\").element",".tables.containing(.staticText, identifier:\"MISSION NUMBER\").element",".tables.containing(.button, identifier:\"add\").element"],[[[-1,12],[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }


}
