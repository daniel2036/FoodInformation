//
//  FoodInformationUITests.swift
//  FoodInformationUITests
//
//  Created by Daniel Xu on 8/5/24.
//

import XCTest

final class FoodInformationUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTabExist() {
        for tabItemID in ["MenuTab", "DessertTab", "OrderTab"] {
            let tabItem = app.tabBars.buttons[tabItemID]
            tabItem.tap()
        }
    }
    
    func testFirstMenuItem() {
        let mapleFrenchToastLink = app.buttons["Maple French Toast"]
        XCTAssert(mapleFrenchToastLink.waitForExistence(timeout: 5.0), "Maple French Toast link not found")
        mapleFrenchToastLink.tap()
        XCTAssert(app.staticTexts["Maple French Toast"].exists)
    }
    
    func testFirstDessertItem() {
        let tabItemID = app.tabBars.buttons["DessertTab"]
        tabItemID.tap()
        let DessertItem = app.staticTexts["Apam balik"]
        XCTAssertTrue(DessertItem.waitForExistence(timeout: 10.0), "'Apam balik' not found")
        XCTAssert(DessertItem.exists)
    }
    
    func testSearchBarType() {
        let searchBar = app.searchFields["Search"]
        XCTAssert(searchBar.exists)
        searchBar.tap()
        searchBar.typeText("Maple French Toast")
        app.buttons["Search"].tap()
        let stackoPancakes = app.staticTexts["Stack-o-Pancakes"]
        XCTAssertFalse(stackoPancakes.exists, "Stack-o-Pancakes should not be found")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
