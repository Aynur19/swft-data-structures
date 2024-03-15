//
//  LinkedListTests.swift
//  
//
//  Created by Aynur Nasybullin on 12.03.2024.
//

@testable import SwiftDataStructures
import XCTest

final class LinkedListTests: XCTestCase {
    // MARK: LeetCode Problem 707. Design Linked List
    lazy var testCases_707: [[(command: String, args: [Int], expected: Int)]] = {
        var testsData = [[(command: String, args: [Int], expected: Int)]]()
        
        testsData.append([
            (command: "LinkedList",         args: [], expected: 0),
            (command: "addAtHead",          args: [1], expected: 0),
            (command: "addAtEnd",           args: [3], expected: 0),
            (command: "addAtIndex",         args: [1, 2], expected: 0),
            (command: "get",                args: [1], expected: 2),
            (command: "deleteFromIndex",    args: [1], expected: 0),
            (command: "get",                args: [1], expected: 3)
        ])
        
        testsData.append([
            (command: "LinkedList",         args: [], expected: 0),
            (command: "addAtHead",          args: [4], expected: 0),
            (command: "get",                args: [1], expected: -1),
            (command: "addAtHead",          args: [1], expected: 0),
            (command: "addAtHead",          args: [5], expected: 0),
            (command: "deleteFromIndex",    args: [3], expected: 0),
            (command: "addAtHead",          args: [7], expected: 0),
            (command: "get",                args: [3], expected: 4),
            (command: "get",                args: [3], expected: 4),
            (command: "get",                args: [3], expected: 4),
            (command: "addAtHead",          args: [1], expected: 0),
            (command: "deleteFromIndex",    args: [4], expected: 0)
        ])
        
        testsData.append([
            (command: "LinkedList",         args: [0], expected: 0),
            (command: "addAtHead",          args: [7], expected: 0),
            (command: "addAtHead",          args: [2], expected: 0),
            (command: "addAtHead",          args: [1], expected: 0),
            (command: "addAtIndex",         args: [3, 0], expected: 0),
            (command: "deleteFromIndex",    args: [2], expected: 0),
            (command: "addAtHead",          args: [6], expected: 0),
            (command: "addAtEnd",           args: [4], expected: 0),
            (command: "get",                args: [4], expected: 4),
            (command: "addAtHead",          args: [4], expected: 0),
            (command: "addAtIndex",         args: [5, 0], expected: 0),
            (command: "addAtHead",          args: [6], expected: 0)
        ])
        
        testsData.append([
            (command: "LinkedList",     args: [], expected: 0),
            (command: "addAtEnd",       args: [1], expected: 0),
            (command: "get",            args: [0], expected: 1)
        ])
        
        return testsData
    }()

    func testsLinkedList() throws {
        for testCase in testCases_707 {
            let list = LinkedList<Int>()
            
            for data in testCase {
                let message = "command: '\(data.command)'; args: \(data.args)"
                var actual = 0
                
                switch data.command {
                    case "addAtHead":
                        list.addAtHead(data.args[0])
                    case "addAtEnd":
                        list.addAtEnd(data.args[0])
                    case "addAtIndex":
                        _ = list.addAtIndex(data.args[0], data.args[1])
                    case "deleteFromIndex":
                        _ = list.deleteFromIndex(data.args[0])
                    case "get":
                        actual = list.get(data.args[0]) ?? -1
                        XCTAssertEqual(actual, data.expected, message)
                    default:
                        break
                }
            }
        }
    }

    
    // MARK: LeetCode Problem 1171. Remove Zero Sum Consecutive Nodes from Linked List
    lazy var testCases_1171: [(values: [Int], expected: ListNode<Int>?)] = {
        var testsData = [(values: [Int], expected: ListNode<Int>?)]()
        
        testsData.append((
            values: [1, 2, -3, 3, 1],
            expected: .init(3, next: .init(1))
        ))
        
        testsData.append((
            values: [1, 2, 3, -3, 4],
            expected: .init(1, next: .init(2, next: .init(4)))
        ))
        
        testsData.append((
            values: [1, 2, 3, -3, -2],
            expected: .init(1)
        ))
        
        return testsData
    }()
    
    func testsRemoveZeroSumSublists() throws {
        for data in testCases_1171 {
            let list = LinkedList<Int>(data.values)
            let message = "values: \(data.values)"
            
            list.removeZeroSumSublists()
            
            XCTAssertEqual(list.getNode(0), data.expected, message)
        }
    }
}
