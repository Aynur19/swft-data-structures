//
//  ArrayExtTests.swift
//  
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

import XCTest

final class ArrayExtTests: XCTestCase {
    // MARK: LeetCode Problem 238. Product of Array Except Self
    
    lazy var testsData_ProductExceptSelf: [(nums: [Int], expected: [Int])] = {
        var testsData = [(nums: [Int], expected: [Int])]()
        
        testsData.append((nums: [1,2,3,4], expected: [24,12,8,6]))
        testsData.append((nums: [-1,1,0,-3,3], expected: [0,0,9,0,0]))
        
        return testsData
    }()
    
    func testsProductExceptSelf() throws {
        for data in testsData_ProductExceptSelf {
            let message = "nums: \(data.nums)"
            let actual = data.nums.productExceptSelf(data.nums)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
