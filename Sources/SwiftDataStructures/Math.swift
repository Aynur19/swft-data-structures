//
//  Math.swift
//
//
//  Created by Aynur Nasybullin on 13.03.2024.
//

public final class Math {
    /// Getting the sum of `n` elements of an arithmetic progression
    /// - Parameters:
    ///   - start: starting value of the arithmetic progression
    ///   - n: number of progression elements
    ///   - dff: difference between adjacent terms of the progression
    static func arithProgressionSum(_ start: Int, n: Int, diff: Int) -> Int {
        let last = start + (n - 1) * diff
        let sum = n * (start + last) / 2
        return sum
    }
    
    /// Getting the sum of the terms of an arithmetic progression from the `n`th to the `m`th.
    /// Indexes `startIdx` and `endIdx` - start at 1
    /// - Parameters:
    ///   - start: value of the `n`-th element
    ///   - startIdx: index of the element at the beginning of the progression sequence
    ///   - endIdx: index of the element at the beginning of the progression sequence
    ///   - dff: difference between adjacent terms of the progression
    static func arithProgressionSum(_ start: Int, startIdx: Int, endIdx: Int, diff: Int) -> Int {
        return (2 * start + diff * (endIdx - startIdx)) * (endIdx - startIdx + 1) / 2
    }
}
