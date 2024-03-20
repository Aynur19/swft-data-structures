//
//  ArrayExt.swift
//
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

extension Array<Int> {
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
    
    
    // MARK: LeetCode Problem 15. 3Sum
    // Link: https://leetcode.com/problems/3sum/
    // Approach: Three Pointers, Sorting
    // Time complexity: O(n log n)
    // Space complexity: O(1)
    public func getSet3SumWithResult0() -> [[Int]] {
        let nums = self.sorted()
        
        var result = [[Int]]()
        var idx = 0, left = 0, right = 0
        var last = [1, 1, 1]
        
        while nums[idx] < 0, idx + 2 < nums.count {
            if idx > 0, nums[idx] == nums[idx - 1] {
                idx += 1
                continue
            }
            
            left = idx + 1
            right = nums.count - 1
            
            while left < right {
                let value = nums[idx] + nums[left] + nums[right]
                
                if value == 0 {
                    let new = [nums[idx], nums[left], nums[right]]
                    if last != new {
                        result.append(new)
                        last = new
                    }
                    right -= 1
                    left += 1
                    
                    continue
                } else if value > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
            
            idx += 1
        }
        
        if idx < nums.count - 2, nums[idx + 2] == 0 {
            result.append([0, 0, 0])
        }
        
        return result
    }
    
    
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
}
