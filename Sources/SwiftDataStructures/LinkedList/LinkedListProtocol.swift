//
//  LinkedListProtocol.swift
//
//
//  Created by Aynur Nasybullin on 12.03.2024.
//

protocol LinkedListProtocol {
    associatedtype ValueType
    
    func get(_ index: Int) -> ValueType?

    func empty() -> Bool

    
    func addAtHead(_ val: ValueType)

    func addAtEnd(_ val: ValueType)

    func addAtIndex(_ index: Int, _ val: ValueType) -> Bool

    
    func removeFromHead() -> ValueType?

    func removeFromEnd() -> ValueType?

    func removeFromIndex(_ index: Int) -> ValueType?

    
    func deleteFromHead() -> Bool

    func deleteFromEnd() -> Bool

    func deleteFromIndex(_ index: Int) -> Bool
}
