//
//  IntExtTests.swift
//  
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

import XCTest
@testable import SwiftDataStructures

final class IntExtTests: XCTestCase {
    func testsPivotInteger() throws {
        lazy var testsData: [(n: Int, expected: Int)] = {
            var testsData = [(n: Int, expected: Int)]()
            
            testsData.append((n: 8, expected: 6))
            testsData.append((n: 1, expected: 1))
            testsData.append((n: 4, expected: -1))
            
            return testsData
        }()
        
        for data in testsData {
            let message = "n: \(data.n)"
            let actual = Int.pivotInteger(data.n)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
