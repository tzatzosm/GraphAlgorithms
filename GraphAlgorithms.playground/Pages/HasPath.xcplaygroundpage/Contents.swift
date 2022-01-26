import Foundation

// Write a function, hasPath, that takes in an object representing the adjacency list of a directed acyclic graph and two nodes (src, dst).
// The function should return a boolean indicating whether or not there exists a directed path between the source and destination nodes.

// n = # of nodes
// e = # of edges
// Time = O(e) cause we have to travel through the edges
// Space = O(n)
func hasPath(graph: [String: [String]], src: String, dest: String) -> Bool{
    var queue = Queue<String>()
    queue.enqueue(src)
    while !queue.isEmpty {
        let current = queue.dequeue()!
        if let neighbors = graph[current], !neighbors.isEmpty {
            for neighbor in neighbors {
                if neighbor == dest {
                    return true
                }
                queue.enqueue(neighbor)
            }
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

