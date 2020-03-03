module MatrixApi
  module Graphql
    class Somos
      def self.client(cookie)
        @@graphlient ||= Graphlient::Client.new(Rails.configuration.settings[:matrix][:somos][:api][:graphql][:url],
          http: Graphlient::Adapters::HTTP::HTTPAdapter,
          headers: {
            'Content-Type': 'application/json',
            'scope': 'matriz',
            'Cookie': "_somos_matriz_api_session=#{cookie}" 
          }
        )
        self.new
      end
      def query(query_string)
        response = @@graphlient.query <<-GRAPHQL
          query {
            #{query_string}
          }
        GRAPHQL
        response.data
      end
    end
  end
end
