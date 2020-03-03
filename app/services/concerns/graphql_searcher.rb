module GraphqlSearcher
  def search_names(name)
    edges = load_edges
    edges = edges.select{ |e| e.node.name.downcase.eql? name.downcase } if name.present?
    format_edges(edges)
  end

  def load_edges
    @somos_client.query(query_string).send(object_type_name).edges
  end

  def format_edges(edges)
    edges.map{|e| e.node.name}
  end

end