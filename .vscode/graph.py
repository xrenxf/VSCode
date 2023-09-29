from collections import defaultdict


class Graph:
    def __init__(self):
        self.graph = defaultdict(list)

    def add_edge(self, u, v):
        self.graph[u].append(v)

    def dfs_util(self, v, visited):
        visited.add(v)
        print(v, end=' ')

        for neighbor in self.graph[v]:
            if neighbor not in visited:
                self.dfs_util(neighbor, visited)

    def dfs(self, start):
        visited = set()
        print("Depth First Traversal (DFS):")
        self.dfs_util(start, visited)
        print()

    def bfs(self, start):
        visited = set()
        queue = []
        visited.add(start)
        queue.append(start)

        print("Breadth First Traversal (BFS):")

        while queue:
            vertex = queue.pop(0)
            print(vertex, end=' ')

            for neighbor in self.graph[vertex]:
                if neighbor not in visited:
                    visited.add(neighbor)
                    queue.append(neighbor)
        print()


# Inisialisasi graf
g = Graph()

# Tambahkan edge/ruas antara node/graf
g.add_edge(1, 2)
g.add_edge(1, 4)
g.add_edge(2, 1)
g.add_edge(2, 5)
g.add_edge(4, 6)
g.add_edge(5, 2)
g.add_edge(5, 3)
g.add_edge(5, 7)
g.add_edge(5, 9)
g.add_edge(6, 7)
g.add_edge(7, 6)
g.add_edge(7, 11)
g.add_edge(8, 9)
g.add_edge(8, 11)
g.add_edge(9, 5)
g.add_edge(9, 8)
g.add_edge(11, 7)
g.add_edge(11, 10)

# Jalankan DFS dan BFS dari node/graf awal
g.dfs(1)
g.bfs(1)