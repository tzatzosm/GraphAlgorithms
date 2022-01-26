import Foundation

func undirectedPath(edges: [[String]], nodeA: String, nodeB: String) -> Bool {
    if nodeA == nodeB { return true }
    // Transform the graph into a directed one - allows to traverse in an easier way
    let graph = edges.reduce(into: [String: [String]]()) { result, edge in
        result[edge[0]] = (result[edge[0]] ?? []) + [edge[1]]
        result[edge[1]] = (result[edge[1]] ?? []) + [edge[0]]
    }
    var visited = Set<String>()
    return hasPath(graph: graph, src: nodeA, dest: nodeB, visited: &visited)
}

func hasPath(graph: [String: [String]], src: String, dest: String, visited: inout Set<String>) -> Bool {
    if src == dest { return true }
    visited.insert(src)
    guard let neighbors = graph[src]?.filter({ !visited.contains($0) }), !neighbors.isEmpty else { return false }
    for neighbor in neighbors {
        if hasPath(graph: graph, src: neighbor, dest: dest, visited: &visited) {
            return true
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

undirectedPath(edges: edges, nodeA: "i", nodeB: "k")
undirectedPath(edges: edges, nodeA: "i", nodeB: "o")
