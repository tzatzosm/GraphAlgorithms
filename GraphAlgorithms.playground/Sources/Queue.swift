import Foundation

public struct Queue<T> {
    private var elements: [T] = []

    public init() { }

    public mutating func enqueue(_ value: T) {
        elements.append(value)
    }

    public mutating func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }

    public var head: T? {
        elements.first
    }

    public var tail: T? {
        elements.last
    }

    public var isEmpty: Bool {
        elements.isEmpty
    }
}

