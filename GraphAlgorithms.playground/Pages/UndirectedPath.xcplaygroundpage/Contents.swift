import Foundation

// Write a function, undirectedPath, that takes in an array of edges for an undirected graph and two nodes (nodeA, nodeB).
// The function should return a boolean indicating whether or not there exists a path between nodeA and nodeB.

// n: Nodes
// e: Edges
// Time: O(e)
// Space: O(n)
func undirectedPath(edges: [[String]], nodeA: String, nodeB: String) -> Bool {
    if nodeA == nodeB { return true }
    // Transform the graph into a directed one - allows to traverse in an easier way
    let graph = edges.reduce(into: [String: [String]]()) { result, edge in
        result[edge[0]] = (result[edge[0]] ?? []) + [edge[1]]
        result[edge[1]] = (result[edge[1]] ?? []) + [edge[0]]
    }
    print(graph)
    // Because this is an udirected graph we need to keep track of the visited nodes
    var visited = Set<String>()
    // Traverse the graph
    var queue = Queue<String>()
    queue.enqueue(nodeA)
    while !queue.isEmpty {
        let current = queue.dequeue()!
        visited.insert(current)
        // Only traverse through the not already visited neighbors
        if let neighbors = graph[current]?.filter({ !visited.contains($0) }), neighbors.count > 0 {
            for neighbor in neighbors {
                if nodeB == neighbor {
                    return true
                }
                queue.enqueue(neighbor)
            }
        }
    }
    return false
}

var edges = [
    ["i", "j"],
    ["k", "i"],
    ["m", "k"],
    ["k", "l"],
    ["o", "n"]
]

print(undirectedPath(edges: edges, nodeA: "i", nodeB: "k")) // true
print(undirectedPath(edges: edges, nodeA: "i", nodeB: "o")) // false
