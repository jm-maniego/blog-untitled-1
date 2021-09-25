# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'BlogApi' do
  context '::Client' do
    describe '#posts' do
      it 'can fetch posts' do
        expect(BlogApi::Client.new.posts.all.length).to be > 0
      end
    end

    # describe '#posts.published' do
    #   it 'can fetch published posts' do
    #     expect(BlogApi::Client.new.posts.published).to eq([])
    #   end
    # end

    # describe '#comments' do
    #   it 'can fetch comments' do
    #     expect(BlogApi::Client.new.comments).to eq([])
    #   end
    # end

    describe '#create_post' do
      context 'valid' do
        subject do
          BlogApi::Client.new.create_post({ title: 'Hello world title', body: 'Hello world body' })
        end

        it 'has title' do
          expected_title = 'Hello world title'
          actual_title = subject.title
          expect(actual_title).to eq(expected_title)
        end

        it 'has body' do
          expected_body = 'Hello world body'
          actual_body = subject.body
          expect(actual_body).to eq(expected_body)
        end

        it 'has persisted' do
          expect{ subject }.to change{ BlogApi::Client.new.posts.all.length }.by(1)
        end
      end

      context 'invalid' do
        subject do
          BlogApi::Client.new.create_post({})
        end

        it 'can create post' do
          expect(subject.errors).to be_present
        end

        it 'did not persist' do
          expect{ subject }.to_not change{ BlogApi::Client.new.posts.all.length }
        end
      end
    end
  end
end
