import Foundation

public struct Stack<T> {
    private var elements: [T] = []

    public init() { }

    public var isEmpty: Bool {
        elements.isEmpty
    }

    public var count: Int {
        elements.count
    }

    public mutating func push(_ text: T) {
        elements.append(text)
    }

    public mutating func pop() -> T? {
        elements.popLast()
    }

    public func peek() -> T? {
        elements.last
    }
}
