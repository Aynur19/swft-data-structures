//
//  StringExt.swift
//
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

extension String {
    // MARK: LeetCode Problem 1750. Minimum Length of String After Deleting Similar Ends
    // LeetCode problem: https://leetcode.com/problems/minimum-length-of-string-after-deleting-similar-ends/
    // Approach: Two Pointers
    // Time complexity: O(n)
    // Space complexity: O(n)
    public func minLengthDiffPrefixSuffix() -> Int {
        let n = count
        guard n > 1 else { return n }
        
        let chars = Array(self)
        var left = -1
        var right = n
        
        left += 1
        right -= 1
        while true {
            if left == right { return chars[left - 1] == chars[right] ? 0 : 1 }
            if left > right { return chars[left - 1] == chars[left] ? 0 : 1 }
            
            while left < right {
                if chars[left] == chars[right] {
                    left += 1
                } else { break }
            }
            
            let prevLeft = left - 1 < 0 ? 0 : left - 1
            while left < right {
                if chars[right] == chars[prevLeft] {
                    right -= 1
                } else { break }
            }
            
            if chars[left] != chars[right] { return right - left + 1 }
        }
    }
    
    
    // MARK: LeetCode Problem 14. Longest Common Prefix
    // Link: https://leetcode.com/problems/longest-common-prefix/
    // Approach: Pointer, String, Array
    // Time complexity: O(m * n)
    // Space complexity: O(1)
    public static func longestCommonPrefix(_ strs: [String]) -> String {
        guard var common = strs.min() else { return "" }
        var containsCount = 0
        
        while !common.isEmpty {
            containsCount = 0
            
            for i in 0..<strs.count {
                if strs[i].hasPrefix(common) {
                    containsCount += 1
                } else { break }
            }
            
            if containsCount == strs.count { break }
            
            common.removeLast()
        }
        
        return containsCount == strs.count ? common : ""
    }
}
