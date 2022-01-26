import Foundation

func depthFirstTraversal(graph: [String: [String]], node: String) {
    var stack = Stack<String>()
    stack.push(node)
    while !stack.isEmpty {
        if let currentKey = stack.pop() {
            print(currentKey)
            if let neighbors = graph[currentKey], !neighbors.isEmpty {
                for neighbor in neighbors {
                    stack.push(neighbor)
                }
            }
        }
    }
}

let graph: [String: [String]] = [
    "a": ["b", "c"],
    "b": ["d"],
    "c": ["e"],
    "d": ["f"],
    "e": [],
    "f": []
]
depthFirstTraversal(graph: graph, node: "a") // a, c, e, b, d, f
