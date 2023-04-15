require 'swagger_helper'

RSpec.describe 'api/blogs', type: :request do
  path '/users/:user_id/posts.json' do
    get 'Retrieves a list of all posts for a user' do
      tags 'Posts'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   text: { type: :string },
                   author: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       name: { type: :string },
                       photo: { type: :string, nullable: true },
                       bio: { type: :string, nullable: true }
                     },
                     required: %w[id name]
                   },
                   comments: {
                     type: :array,
                     items: {
                       type: :object,
                       properties: {
                         id: { type: :integer },
                         text: { type: :string },
                         author_id: { type: :integer },
                         post_id: { type: :integer }
                       },
                       required: %w[id text author_id post_id]
                     }
                   }
                 },
                 required: %w[id title text author comments]
               }

        run_test!
      end
    end
  end

  path '/users/:user_id/posts/:post_id/comments.json' do
    get 'Retrieves comments for a post' do
      tags 'Comments'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   author_id: { type: :integer },
                   post_id: { type: :integer },
                   text: { type: :string }
                 },
                 required: %w[id author_id post_id text]
               }

        run_test!
      end
    end
  end

  path '/users/:user_id/posts/:post_id/comments' do
    post 'Creates a new comment' do
      tags 'Comments'
      consumes 'application/json'

      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          author_id: { type: :integer },
          post_id: { type: :integer },
          text: { type: :string }
        },
        required: %w[author_id post_id text]
      }

      response '201', 'Created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 author_id: { type: :integer },
                 post_id: { type: :integer },
                 text: { type: :string }
               },
               required: %w[id author_id post_id text]

        let(:comment) do
          {
            author_id: 1,
            post_id: 11,
            text: 'This is a new comment'
          }
        end

        run_test!
      end

      response '400', 'Bad Request' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']

        let(:comment) { { author_id: 1, post_id: 11 } } # missing required 'text' attribute

        run_test!
      end
    end
  end
end
