//
//  ArrayExt.swift
//
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

extension Array<Int> {
    // LeetCode problem: https://leetcode.com/problems/product-of-array-except-self/
    // Approach: Array, Prefix Sum
    // Time complexity: O(n)
    // Space complexity: O(1)
    public func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result: [Int] = .init(repeating: 1, count: nums.count)
        var tmp = 1
        let n = nums.count
        
        for idx in 1..<nums.count {
            tmp *= nums[idx - 1]
            result[idx] = tmp
        }
        
        tmp = 1
        for idx in stride(from: n - 2, to: -1, by: -1) {
            tmp *= nums[idx + 1]
            result[idx] *= tmp
        }
        
        return result
    }
}
