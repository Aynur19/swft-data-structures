//
//  ArrayExt.swift
//
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

extension Array<Int> {
    // MARK: LeetCode Problem 1. Two Sum
    // Link: https://leetcode.com/problems/two-sum/description/
    // Approach: Hash Table
    // Time complexity: O(n)
    // Space complexity: O(n)
    public func twoSum(_ target: Int) -> [Int] {
        guard self.count > 1 else { return [] }
        var dict = [Int:Int]()
        
        for idx in self.indices {
            let num = self[idx]
            
            if let index = dict[target - num] {
                return [index, idx]
            }
            
            dict[num] = idx
        }
        
        return []
    }
    
    // MARK: LeetCode Problem 238. Product of Array Except Self
    // Link: https://leetcode.com/problems/product-of-array-except-self/
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
