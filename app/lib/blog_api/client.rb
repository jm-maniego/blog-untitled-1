# frozen_string_literal: true

require 'uri'
require 'net/http'

module BlogApi
  URL = 'http://localhost:4000'

  class Client
    def create_post(params)
      json_response = post_request("#{URL}/posts", { post: params })
      Post.new(json_response.fetch('post'), json_response['errors'])
    end

    def posts
      json_response = Net::HTTP.get(URI("#{URL}/posts"))
      posts = JSON.parse(json_response).fetch('posts')
      PostsCollection.new(posts)
    end

    def comments; end

    private

    def post_request(url, params)
      uri = URI(url)
      request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = params.to_json

      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end

      JSON.parse(response.body)
    end
  end
end
