//
//  StringExtTests.swift
//  
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

import XCTest

final class StringExtTests: XCTestCase {
    // MARK: LeetCode Problem 1750. Minimum Length of String After Deleting Similar Ends
    // LeetCode problem: https://leetcode.com/problems/minimum-length-of-string-after-deleting-similar-ends/
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
    
    func testsProblem_minLengthDiffPrefixSuffix() throws {
        for data in testsData_minLengthDiffPrefixSuffix {
            let message = "s: '\(data.s)'"
            let actual = data.s.minLengthDiffPrefixSuffix()
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    
    // MARK: LeetCode Problem 14. Longest Common Prefix
    // Link: https://leetcode.com/problems/longest-common-prefix/
    lazy var testsData_longestCommonPrefix: [(strs: [String], expected: String)] = {
        var testsData = [(strs: [String], expected: String)]()
        
        testsData.append((strs: ["flower", "flow", "flight"], expected: "fl"))
        testsData.append((strs: ["dog", "racecar", "car"], expected: ""))
        
        return testsData
    }()
    
    func testsProblem_longestCommonPrefix() throws {
        for data in testsData_longestCommonPrefix {
            let message = "strs: '\(data.strs)'"
            let actual = String.longestCommonPrefix(data.strs)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
