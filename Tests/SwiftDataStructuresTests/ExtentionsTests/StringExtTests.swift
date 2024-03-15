//
//  StringExtTests.swift
//  
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

import XCTest

final class StringExtTests: XCTestCase {
    // MARK: LeetCode Problem 238. Product of Array Except Self
    
    lazy var testsData_minLengthDiffPrefixSuffix: [(s: String, expected: Int)] = {
        var testsData = [(s: String, expected: Int)]()
        
        testsData.append((s: "ca", expected: 2))
        testsData.append((s: "cabaabac", expected: 0))
        testsData.append((s: "aabccabba", expected: 3))
        testsData.append((s: "bbbbbbbbbbbbbbbbbbbbbbbbbbbabbbbbbbbbbbbbbbccbcbcbccbbabbb", expected: 1))
        testsData.append((s: "abbbbbbbbbbbbbbbbbbba", expected: 0))
        testsData.append((
            s: "aabbbbbbbbbbbbbbaaaaaaacccccbcbcccbbbccbbbcbcbccacbccccbbabacbaccaccbbcabbbbaaaaaaaaaaaaaaaaaa", 
            expected: 36
        ))
        
        return testsData
    }()
    
    // MARK: Problem 1750. Minimum Length of String After Deleting Similar Ends
    func testsProblem_minLengthDiffPrefixSuffix() throws {
        for data in testsData_minLengthDiffPrefixSuffix {
            let message = "s: '\(data.s)'"
            let actual = data.s.minLengthDiffPrefixSuffix()
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
