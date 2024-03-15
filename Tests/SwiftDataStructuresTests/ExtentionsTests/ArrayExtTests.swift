//
//  ArrayExtTests.swift
//  
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

import XCTest

final class ArrayExtTests: XCTestCase {
    // MARK: LeetCode Problem 1. Two Sum
    // Link: https://leetcode.com/problems/two-sum/description/
    lazy var testsData_twoSum: [(nums: [Int], target: Int, expected: [Int])] = {
        var testsData = [(nums: [Int], target: Int, expected: [Int])]()
        
        testsData.append((nums: [2, 7, 11, 15], target: 9, expected: [0, 1]))
        testsData.append((nums: [3, 2, 4],      target: 6, expected: [1, 2]))
        testsData.append((nums: [3, 3],         target: 6, expected: [0, 1]))
        
        return testsData
    }()
    
    func tests_twoSum() throws {
        for data in testsData_twoSum {
            let message = "nums: \(data.nums)"
            let actual = data.nums.twoSum(data.target)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    
    // MARK: LeetCode Problem 238. Product of Array Except Self
    // Link: https://leetcode.com/problems/product-of-array-except-self/
    lazy var testsData_productExceptSelf: [(nums: [Int], expected: [Int])] = {
        var testsData = [(nums: [Int], expected: [Int])]()
        
        testsData.append((nums: [1,2,3,4], expected: [24,12,8,6]))
        testsData.append((nums: [-1,1,0,-3,3], expected: [0,0,9,0,0]))
        
        return testsData
    }()
    
    func tests_productExceptSelf() throws {
        for data in testsData_productExceptSelf {
            let message = "nums: \(data.nums)"
            let actual = data.nums.productExceptSelf(data.nums)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
