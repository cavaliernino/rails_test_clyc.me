class Graph
  attr_reader :graph, :nodes, :previous, :distance
  INFINITY = 1 << 64

  def initialize
    @graph = {}
    @previous = {}
    @nodes = []
    @path = []
  end

  def connect_graph(source, target, weight)
    if (!graph.has_key?(source))
      graph[source] = {target => weight}
    else
      graph[source][target] = weight
    end
    nodes << source if (!nodes.include?(source))
  end

  def add_edge(source, target, weight)
    connect_graph(source, target, weight)
    connect_graph(target, source, weight)
  end

  def min_distance_node(nodes)
    min_distance = INFINITY
    min_distance_node = nil
    nodes.each do |node|
      min_distance_node = node if @distance[node] < min_distance
    end
    min_distance_node
  end

  def neighbors(node, node_list)
    neighbor_dict = @graph[node]
    neighbor_dict.each do |neighbor|
      neighbor_dict.delete neighbor unless node_list.include? neighbor
    end
    neighbor_dict
  end

  def dijkstra_init(source)
    @distance = {}
    @unvisited = []
    @nodes.each do |node|
      @distance.store(node, INFINITY)
      @previous.store(node, -1)
      @unvisited << node
    end
    @distance.store(source, 0)
  end

  def check_neighbors(node)
    neighbors(node, @unvisited).each do |neighbor|
      alt = @distance[node] + @graph[node][neighbor[0]]
      if alt < @distance[neighbor[0]]
        @distance[neighbor[0]] = alt
        @previous[neighbor[0]] = node
      end
    end
  end

  def dijkstra(source)
    dijkstra_init(source)
    while @unvisited.any?
      node = min_distance_node(@unvisited)
      @unvisited.delete(node)
      check_neighbors(node)
    end
  end

  def find_path(dest)
    find_path @previous[dest] if @previous[dest] != -1
    @path << dest
  end

  def obtain_path
    last_n = nil
    @path.each do |n|
      @result += '-->' if @previous[n] != -1
      @result += n
      last_n = n
    end
    @result += " : #{@distance[last_n]}\n"
  end

  def get_paths(nodes_for_paths)
    nodes_for_paths.each do |node|
      @path = []
      find_path(node)
      @result += 'Target(' + node + ')  '
      obtain_path
    end
    @result
  end

  def shortest_paths(source)
    dijkstra(source)
    @result = ''
    nodes_for_paths = @nodes.clone
    nodes_for_paths.delete source
    get_paths(nodes_for_paths)
  end

end

if __FILE__ == $0
  gr = Graph.new
  gr.add_edge('a', 'c', 7)
  gr.add_edge('a', 'e', 14)
  gr.add_edge('a', 'f', 9)
  gr.add_edge('c', 'd', 15)
  gr.add_edge('c', 'f', 10)
  gr.add_edge('d', 'f', 11)
  gr.add_edge('d', 'b', 6)
  gr.add_edge('f', 'e', 2)
  gr.add_edge('e', 'b', 9)
  gr.shortest_paths('a')
  gr.print_result 

end


