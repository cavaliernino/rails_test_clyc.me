class Graph
  attr_reader :graph, :nodes, :previous, :distance
  INFINITY = 1 << 64

  def initialize
    @graph = {}
    @prev = {}
    @nodes = []
  end

  def connect_graph(source, target, weight)
    if (!graph.has_key?(source))
      graph[source] = {target => weight}
    else
      graph[source][target] = weight
    end
    if (!nodes.include?(source))
      nodes << source
    end
  end

  def add_edge(source, target, weight)
    connect_graph(source, target, weight)
    connect_graph(target, source, weight)
  end

  def min_distance_node(nodes)
    min_distance = INFINITY
    min_distance_node = nil
    nodes.each do |node|
      if @distance[node] < min_distance
        min_distance_node = node
      end
    end
    min_distance_node
  end

  def neighbors(node, node_list)
    neighbor_dict = @graph[node]
    neighbor_dict.each do |neighbor|
      unless node_list.include? neighbor
        neighbor_dict.delete neighbor
      end
    end
    neighbor_dict
  end

  def dijkstra(source)
    @distance = {}
    unvisited = []
    @nodes.each do |node|
      @distance.store(node, INFINITY)
      @prev.store(node, nil)
      unvisited << node
    end
    @distance.store(source, 0)

    while unvisited.any?
      node = min_distance_node(unvisited)
      unvisited.delete(node)
      neighbors(node, unvisited).each do |neighbor|
        alt = @distance[node] + @graph[node][neighbor[0]]
        if alt < @distance[neighbor[0]]
          @distance[neighbor[0]] = alt
          @prev[neighbor[0]] = node
        end
      end
    end
  end

  def find_path(dest)
    if @previous[dest] != -1
      find_path @previous[dest]
    end
    @path << dest
  end

  def shortest_paths(source)
  end

end

if __FILE__ == $0
  gr = Graph.new
  gr.add_edge("a", "c", 7)
  gr.add_edge("a", "e", 14)
  gr.add_edge("a", "f", 9)
  gr.add_edge("c", "d", 15)
  gr.add_edge("c", "f", 10)
  gr.add_edge("d", "f", 11)
  gr.add_edge("d", "b", 6)
  gr.add_edge("f", "e", 2)
  gr.add_edge("e", "b", 9)
  gr.shortest_paths("a")
  gr.print_result 

end


