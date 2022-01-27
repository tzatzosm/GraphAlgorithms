import Foundation

// Write a function, shortestPath, that takes in an array of edges for an undirected graph and two nodes (nodeA, nodeB).
// The function should return the length of the shortest path between A and B.
// Consider the length as the number of edges in the path, not the number of nodes. If there is no path between A and B, then return -1.

// n = # of nodes
// e = # of edges
// time = O(e)
// space = O(n)
func shortestPath(edges: [[String]], nodeA: String, nodeB: String) -> Int {
    let graph = edges.reduce(into: [String: [String]]()) { result, edges in
        result[edges[0]] = (result[edges[0]] ?? []) + [edges[1]]
        result[edges[1]] = (result[edges[1]] ?? []) + [edges[0]]
    }
    var visited = Set<String>()
    var queue = Queue<(node: String, distance: Int)>()
    queue.enqueue((node: nodeA, distance: 0))
    while !queue.isEmpty {
        let (current, distance) = queue.dequeue()!
        if current == nodeB {
            return distance
        }
        visited.insert(current)
        for neighbor in (graph[current] ?? []) where !visited.contains(neighbor) {
            queue.enqueue((node: neighbor, distance: distance + 1))
        }
    }
    return -1
}

var edges: [[String]] = [
  ["w", "x"],
  ["x", "y"],
  ["z", "y"],
  ["z", "v"],
  ["w", "v"]
];
print(shortestPath(edges: edges, nodeA: "w", nodeB: "z")) // 2
print(shortestPath(edges: edges, nodeA: "y", nodeB: "x")) // 1
