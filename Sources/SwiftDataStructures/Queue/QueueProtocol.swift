//
//  QueueProtocol.swift
//
//
//  Created by Aynur Nasybullin on 10.04.2024.
//

protocol QueueProtocol {
    associatedtype ValueType
    
    func enqueue(_ x: ValueType)
    
    func dequeue() -> ValueType?
    
    func peek() -> ValueType?
    
    func empty() -> Bool
    
    func size() -> Int
}
