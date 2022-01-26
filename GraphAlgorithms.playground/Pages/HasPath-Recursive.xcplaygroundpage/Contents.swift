import Foundation

// Write a function, hasPath, that takes in an object representing the adjacency list of a directed acyclic graph and two nodes (src, dst).
// The function should return a boolean indicating whether or not there exists a directed path between the source and destination nodes.

// n = # of nodes
// e = # of edges
// Time = O(e) - through all the edges
// Space = O(n) - Heap size ==
func hasPath(graph: [String: [String]], src: String, dest: String) -> Bool {
    if src == dest { return true }
    guard let neighbors = graph[src], !neighbors.isEmpty else { return false }
    for neighbor in neighbors {
        if hasPath(graph: graph, src: neighbor, dest: dest) {
            return true
        }
    }
    return false
}

let graph = [
    "f": ["g", "i"],
    "g": ["h"],
    "h": [],
    "i": ["g", "k"],
    "j": ["i"],
    "k": []
]
print(hasPath(graph: graph, src: "f", dest: "g")) // true
print(hasPath(graph: graph, src: "f", dest: "k")) // true
print(hasPath(graph: graph, src: "g", dest: "k")) // false
