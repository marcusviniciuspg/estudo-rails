class GraphqlLevelSearcher
  include ::GraphqlSearcher

  def initialize(cookie)
    @somos_client = MatrixApi::Graphql::Somos.client(cookie)
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
end
