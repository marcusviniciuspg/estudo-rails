class GraphqlDisciplineSearcher
  include GraphqlSearcher

  def initialize(cookie)
    @somos_client =  MatrixApi::Graphql::Somos.client(cookie)
    @level_edges = GraphqlLevelSearcher.new(cookie).load_edges
    
  end

  # def query_string
  #   'components {
  #     edges {
  #       node {
  #         id
  #         name
  #         code
  #       }
  #     }
  #   }'
  # end

  def object_type_name
    'components'
  end

  def level_list(edges)
    edges.map { |e| { id: e.node.id,  name: e.node.name } }
  end

  def level_id_by_name(name)
    level_list = level_list(@level_edges)
    level_list.select{ |ll| ll[:name].downcase.eql? name.downcase}.first[:id]
  end

  def query_string_with_filter_by_level_id(level_id)
    id = level_id_by_name(level_id)
    "components (segment:#{id}) {
      edges {
        node {
          id
          name
        }
      }
    }"
  end

  def load_discipline_edges(level_id)
    @somos_client.query(query_string_with_filter_by_level_id(level_id)).send(object_type_name).edges
  end

  def search_discipline_names_by_level_id(name)
    edges = load_discipline_edges(name)
    format_edges(edges)
  end
end
