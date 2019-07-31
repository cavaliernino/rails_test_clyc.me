require 'data_analytics'
describe Graph do
  let(:new_graph) {
    Graph.new
  }
  context "graph creation" do
    it 'should initialize empty graph' do
      graph=new_graph
      expect(graph.graph).to eq({})
    end

    it 'should initialize empty nodes' do
      graph=new_graph
      expect(graph.nodes).to eq([])
    end

    it 'is connect graph with source,target,weight #connect_graph' do
      graph=new_graph
      graph.connect_graph("a", "b", 5)
      expect(graph.graph).to eq({"a" => {"b" => 5}})
    end

    it 'is connect node with source,target,weight #connect_graph' do
      graph=new_graph
      graph.connect_graph("a", "b", 5)
      expect(graph.nodes).to include("a")
    end

    it 'is graph connect  bidirectional #add_edge' do
      graph=new_graph
      graph.add_edge("a", "b", 5)
      expect(graph.graph.keys).to eq(["a", "b"])
    end
  end

  context "Dijkstra's_algorithm" do
    it 'is dijkstras algorithm works to track distance #dijkstra' do
      graph=new_graph
      graph.add_edge("a", "b", 5)
      graph.add_edge("b", "c", 3)
      graph.add_edge("c", "d", 1)
      graph.dijkstra("a")
      expect(graph.distance).to eq({"a"=>0, "b"=>5, "c"=>8, "d"=>9})
    end

    it 'is dijkstras algorithm works to track connected node #dijkstra' do
      graph=new_graph
      graph.add_edge("a", "b", 5)
      graph.add_edge("b", "c", 3)
      graph.add_edge("c", "d", 1)
      graph.dijkstra("a")
      expect(graph.previous).to eq({"a"=>-1, "b"=>"a", "c"=>"b", "d"=>"c"})
    end

    it 'is dijkstra algorithm find shortest path #shortest_paths' do
      graph=new_graph
      graph.add_edge("a", "b", 5)
      graph.add_edge("b", "c", 3)
      graph.add_edge("c", "d", 1)
      expect(graph.shortest_paths("a")).to include ("Target(c)  a-->b-->c : 8")
    end


  end


end
