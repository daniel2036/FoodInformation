//
//  FoodInformationTests.swift
//  FoodInformationTests
//
//  Created by Daniel Xu on 8/5/24.
//

import XCTest
@testable import FoodInformation

final class FoodInformationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let string = """
        {
            "meals": [
            {
                "strMeal": "Apam balik",
                "strMealThumb": "https://themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                "idMeal": "53049"
            }
            ]
        }
        """
        let data = string.data(using: .utf8)
        let decodedData = try! DessertViewModel().decodeResponse(data: data!, type: DessertResponse.self)
        assert(decodedData == DessertResponse(meals: [Dessert(strMeal: "Apam balik", strMealThumb: "https://themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "53049")]))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
