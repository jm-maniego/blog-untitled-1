require 'rails_helper'


RSpec.describe 'BlogApi' do           #
  it 'can fetch posts' do   #
    expect(BlogApi.new.posts.all).to eq([])
  end

  it 'can fetch published posts' do   #
    expect(BlogApi.new.posts.published.all).to eq([])
  end

  it 'can fetch posts' do   #
    expect(BlogApi.new.comments.all).to eq([])
  end
end