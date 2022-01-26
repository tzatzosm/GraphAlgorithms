import Foundation

func breadthFirstTraversal(graph: [String: [String]], node: String) {
    var queue = Queue<String>()
    queue.enqueue(node)
    while !queue.isEmpty {
        if let currentKey = queue.dequeue() {
            print(currentKey)
            if let neighbors = graph[currentKey], !neighbors.isEmpty {
                for neighbor in neighbors {
                    queue.enqueue(neighbor)
                }
            }
        }
    }
}

let graph: [String: [String]] = [
    "a": ["c", "b"],
    "b": ["d"],
    "c": ["e"],
    "d": ["f"],
    "e": [],
    "f": []
]
breadthFirstTraversal(graph: graph, node: "a") // a, c, b, e, d, f
