class Graph
  attr_reader :graph, :nodes, :previous, :distance 
  INFINITY = 1 << 64

  def initialize
    @graph = {}
    @nodes = Array.new
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


  def dijkstra(source)

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


