//
//  IntExt.swift
//
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

extension Int {
    // Approach: Math
    // Time complexity: O(n^(0.5))
    // Space complexity: O(1)
    static func pivotInteger(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        
        var start = n / 2
        var leftSum = Math.arithProgressionSum(1, n: start, diff: 1)
        var rightSum = Math.arithProgressionSum(start, startIdx: start, endIdx: n, diff: 1)
        
        while rightSum > leftSum {
            rightSum -= start
            start += 1
            leftSum += start
        }
        
        return rightSum == leftSum ? start : -1
    }
}
