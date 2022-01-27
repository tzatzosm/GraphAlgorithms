import Foundation

// Write a function, largetComponent, that takes in the adjacency list of an undirected graph.
// The function should return the size of the largest connected component in the graph.

func largestComponent(graph: [String: [String]]) -> Int {
    var visited = Set<String>()
    var largestComponent = 0
    for node in graph.keys {
        largestComponent = max(largestComponent, countSizeOfComponents(in: graph, at: node, visited: &visited))
    }
    return largestComponent
}

func countSizeOfComponents(in graph: [String: [String]], at node: String, visited: inout Set<String>) -> Int {
    if visited.contains(node) { return 0 }
    visited.insert(node)
    var size = 1
    if let neighbors = graph[node] {
        for neighbor in neighbors {
            size += countSizeOfComponents(in: graph, at: neighbor, visited: &visited)
        }
    }
    return size
}

let graph = [
    "0": ["8", "1", "5"],
    "1": ["5"],
    "5": ["0", "8"],
    "8": ["0", "5"],
    "2": ["3", "4"],
    "3": ["2", "4"],
    "4": ["3", "2"]
]
print(largestComponent(graph: graph))

