//
//  File.swift
//  
//
//  Created by Aynur Nasybullin on 10.04.2024.
//

fileprivate let minSize = 10

public final class QueueArray<ValueType> {
    private let defaultValue: ValueType
    private var data: [ValueType]
    private var start: Int
    private var end: Int
    private var count = 0
    
    public init(_ capacity: Int = 10, defaultValue: ValueType) {
        let dataCapacity = max(minSize, capacity) + 1
        
        self.defaultValue = defaultValue
        self.data = .init(repeating: defaultValue, count: dataCapacity)
        
        self.start = data.count - 1
        self.end = data.count - 1
    }

    public init(_ values: [ValueType], defaultValue: ValueType) {
        let n = values.count
        let dataCapacity = n > minSize ? 1 : minSize - n + 1
        
        self.defaultValue = defaultValue
        self.data = .init(repeating: defaultValue, count: dataCapacity)
        self.data.append(contentsOf: values.reversed())
        
        self.start = data.count - 1
        self.end = data.count - n - 1
        self.count = n
    }
}

extension QueueArray: QueueProtocol {
    private func resize(isIncrease: Bool = true) {
        let size = data.count
        var oldStart = start
        
        var capacity = isIncrease ? Int(Double(size) * 1.5) : Int(Double(size) / 1.5)
        capacity = capacity > minSize ? capacity : minSize + 1
        
        if capacity == data.count { return }
        
        var newData = Array<ValueType>(repeating: defaultValue, count: capacity)
        var idx = newData.count - 1
        
        while true {
            newData[idx] = data[oldStart]
            
            oldStart -= 1
            idx -= 1
            
            if oldStart < 0 {
                oldStart = size - 1
            }
            if oldStart == end { break }
        }
        
        start = newData.count - 1
        end = idx
        data = newData
    }
    
    public func enqueue(_ x: ValueType) {
        data[end] = x
        end = end > 0 ? end - 1 : data.count - 1
        count += 1
        
        if abs(end - start) == 1 {
            resize()
        }
    }
    
    public func dequeue() -> ValueType? {
        guard start != end else { return nil }
        
        let result = data[start]
        start -= 1
        
        if start < 0 {
            start = data.count - 1
        }
    
        count -= 1
        
        if abs(end - start) == 1 {
            resize(isIncrease: false)
        }
        
        return result
    }
    
    public func peek() -> ValueType? {
        guard start != end else { return nil }
        
        return data[start]
    }
    
    public func empty() -> Bool {
        return start == end
    }
    
    public func size() -> Int { count }
}
