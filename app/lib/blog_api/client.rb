# frozen_string_literal: true

require 'uri'
require 'net/http'

module BlogApi
  BASE_URL = 'http://localhost:4000'

  class Client
    def create_post(params)
      json_response = Client.post_request("#{BASE_URL}/posts", { post: params })
      Post.new(json_response.fetch('post'), json_response['errors'])
    end

    def posts
      response = Net::HTTP.get(URI("#{BASE_URL}/posts"))
      posts = JSON.parse(response).fetch('posts')
      PostsCollection.new(posts)
    end

    def get_post(id)
      response = Net::HTTP.get(URI("#{BASE_URL}/posts/#{id}"))
      post = JSON.parse(response)
      Post.new(post)
    end

    def self.post_request(url, params)
      uri = URI(url)
      request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = params.to_json

      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end

      JSON.parse(response.body)
    end

    def self.get_request(url)
      res = Net::HTTP.get(URI("#{BASE_URL}#{url}"))
      JSON.parse(res)
    end
  end
end
