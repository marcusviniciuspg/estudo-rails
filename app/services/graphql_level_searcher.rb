class GraphqlLevelSearcher
  include ::GraphqlSearcher

  def initialize(cookie)
    @cookie = cookie
    @somos_client = MatrixApi::Graphql::Somos.client(@cookie)
  end

  def query_string
    'segments {
      edges {
        node {
          id
          name
        }
      }
    }'
  end

  def object_type_name
    'segments'
  end

  def self.discipline_by_levels(levels_searcher)
    levels_searcher.load_edges.map do |edge|
      discipline_searcher = GraphqlDisciplineSearcher.new(@cookie)
      {
        level_name: edge.node.name,
        disciplines: discipline_searcher.search_discipline_names_by_level_id(edge.node.name)
      }
    end
  end
end
