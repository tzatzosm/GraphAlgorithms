import Foundation

// Write a function, connectedComponentsCount, that takes in the adjacency list of an undirected graph.
// The function should return the number of connected components within the graph.

// n = # of nodes
// e = # of edges
// time = O(e)
// space = O(n)
func connectedComponentsCount(graph: [String: [String]]) -> Int {
    var componentsCount = 0
    var visited = Set<String>()
    for node in graph.keys {
        componentsCount += traverse(graph: graph, node: node, visited: &visited) ? 1 : 0
    }
    return componentsCount
}

func traverse(graph: [String: [String]], node: String, visited: inout Set<String>) -> Bool {
    if visited.contains(node) { return false }
    visited.insert(node)
    if let neighbors = graph[node] {
        for neighbor in neighbors {
            traverse(graph: graph, node: neighbor, visited: &visited)
        }
    }
    return true
}

let graph = [
    "0": ["8", "1", "5"],
    "1": ["0"],
    "5": ["0", "8"],
    "8": ["0", "5"],
    "2": ["3", "4"],
    "3": ["2", "4"],
    "4": ["3", "2"]
]
print(connectedComponentsCount(graph: graph))


