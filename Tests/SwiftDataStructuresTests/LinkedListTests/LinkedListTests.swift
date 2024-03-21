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

    func tests_linkedList() throws {
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
    
    
    // MARK: LeetCode Problem 1669. Merge In Between Linked Lists
    // Link: https://leetcode.com/problems/merge-in-between-linked-lists/
    lazy var testCases_mergeInBetween: [(list1: ListNode<Int>?, a: Int, b: Int, list2: ListNode<Int>?, expected: ListNode<Int>?)] = {
        var testsData = [(list1: ListNode<Int>?, a: Int, b: Int, list2: ListNode<Int>?, expected: ListNode<Int>?)]()
        
        testsData.append((
            list1: LinkedList([10, 1, 13, 6, 9, 5]).getNode(0),
            a: 3, b: 4,
            list2: LinkedList([1000000, 1000001, 1000002]).getNode(0),
            expected: LinkedList([10, 1, 13, 1000000, 1000001, 1000002, 5]).getNode(0)
        ))
        testsData.append((
            list1: LinkedList([0, 1, 2, 3, 4, 5, 6]).getNode(0),
            a: 2, b: 5,
            list2: LinkedList([1000000, 1000001, 1000002, 1000003, 1000004]).getNode(0),
            expected: LinkedList([0, 1, 1000000, 1000001, 1000002, 1000003, 1000004, 6]).getNode(0)
        ))
        
        return testsData
    }()
    
    func tests_mergeInBetween() throws {
        for data in testCases_mergeInBetween {
            let message = "list1: \(data.list1?.description ?? "[]"); list2: \(data.list2?.description ?? "[]"); "
            let message2 = "a: \(data.a); b: \(data.b)"
            
            let lList = LinkedList(data.list1!)
            lList.mergeInBetween(data.list2, startIn: data.a, endIn: data.b)
            
            XCTAssertEqual(lList.getNode(0), data.expected!, message + message2)
        }
    }

    
    // MARK: LeetCode Problem 1171. Remove Zero Sum Consecutive Nodes from Linked List
    // link: https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/
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
    
    func tests_removeZeroSumSublists() throws {
        for data in testCases_1171 {
            let list = LinkedList<Int>(data.values)
            let message = "values: \(data.values)"
            
            list.removeZeroSumSublists()
            
            XCTAssertEqual(list.getNode(0), data.expected, message)
        }
    }
    
    
    // MARK: LeetCode Problem 206. Reverse Linked List
    // Link: https://leetcode.com/problems/3sum/
    lazy var testCases_reverse: [(head: ListNode<Int>?, expected: ListNode<Int>?)] = {
        var testsData = [(head: ListNode<Int>?, expected: ListNode<Int>?)]()
        
        testsData.append((
            head: LinkedList([1, 2, 3, 4, 5]).getNode(0),
            expected: LinkedList([5, 4, 3, 2, 1]).getNode(0)
        ))
        testsData.append((
            head: .init(1, next: .init(2)),
            expected: .init(2, next: .init(1))
        ))
        testsData.append((head: nil, expected: nil))
        
        return testsData
    }()
    
    func tests_reverse() throws {
        for idx in 0...1 {
            for data in testCases_reverse {
                let message = "idx: \(idx + 1); head: \(data.head?.description ?? "[]")"
                let lList = data.head != nil ? LinkedList<Int>(data.head!) : .init()
                let actual: ListNode<Int>?
                
                switch idx {
                    case 0:
                        actual = lList.reversed().getNode(0)
                    default:
                        lList.reverse()
                        actual = lList.getNode(0)
                }
                
                if data.expected != nil {
                    XCTAssertEqual(actual!, data.expected!, message)
                } else {
                    XCTAssertTrue((actual == nil && data.expected == nil), message)
                }
            }
        }
    }
    
    
    // MARK: LeetCode Problem 2. Add Two Numbers
    // Link: https://leetcode.com/problems/add-two-numbers/
    lazy var testCases_2: [(l1: ListNode<Int>?, l2: ListNode<Int>?, expected: ListNode<Int>?)] = {
        var testsData = [(l1: ListNode<Int>?, l2: ListNode<Int>?, expected: ListNode<Int>?)]()
        
        testsData.append((
            l1: LinkedList([2, 4, 3]).getNode(0),
            l2: LinkedList([5, 6, 4]).getNode(0),
            expected: LinkedList([7, 0, 8]).getNode(0)
        ))
        
        testsData.append((
            l1: .init(0),
            l2: .init(0),
            expected: .init(0)
        ))
        
        testsData.append((
            l1: LinkedList([9, 9, 9, 9, 9, 9, 9]).getNode(0),
            l2: LinkedList([9, 9, 9, 9]).getNode(0),
            expected: LinkedList([8, 9, 9, 9, 0, 0, 0, 1]).getNode(0)
        ))
        
        testsData.append((
            l1: LinkedList([2, 4, 9]).getNode(0),
            l2: LinkedList([5, 6, 4, 9]).getNode(0),
            expected: LinkedList([7, 0, 4, 0, 1]).getNode(0)
        ))
        
        return testsData
    }()
    
    func tests_addNumbers() throws {
        for data in testCases_2 {
            let message = "l1: \(data.l1?.description ?? "[]"); l2: \(data.l2?.description ?? "[]")"
            let actual = LinkedList.addNumbers(data.l1, data.l2)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
