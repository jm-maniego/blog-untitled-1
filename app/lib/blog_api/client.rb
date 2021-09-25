# frozen_string_literal: true

require 'uri'
require 'net/http'

module BlogApi
  BASE_URL = 'http://localhost:4000'

  class Client
    def create_post(params)
      json_response = Client.post_request('/posts', { post: params })
      Post.new(json_response.fetch('post'), json_response['errors'])
    end

    def create_comment(params)
      post_id = params.fetch(:post_id)
      json_response = Client.post_request("/posts/#{post_id}/comments", { comment: params })
      Comment.new(json_response.fetch('comment').merge('post_id' => post_id))
    end

    def posts
      json_response = Client.get_request('/posts')
      posts = json_response.fetch('posts')
      PostsCollection.new(posts)
    end

    def get_post(id)
      json_response = Client.get_request("/posts/#{id}")
      Post.new(json_response)
    end

    def self.post_request(url, params)
      uri = URI("#{BASE_URL}#{url}")
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
