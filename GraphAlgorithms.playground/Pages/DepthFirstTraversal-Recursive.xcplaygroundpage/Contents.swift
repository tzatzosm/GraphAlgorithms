import Foundation

func depthFirst(graph: [String: [String]], node: String) {
    print(node)
    if let neighbors = graph[node] {
        for neighbor in neighbors {
            depthFirst(graph: graph, node: neighbor)
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
depthFirst(graph: graph, node: "a") // a, b, d, f, c, e
