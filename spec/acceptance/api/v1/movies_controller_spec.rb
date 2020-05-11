require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.resource 'Movies' do
  route '/api/v1/movies', 'An endpoint to return the movies, ordered by creation' do

    get 'index' do
      context 'When movies are exist' do
        let!(:movie) { FactoryBot.create_list(:movie, 10) }

        example_request 'Get movies list' do
          expect(status).to eq(200)
          expect(JSON.parse(response_body).size).to eq(10)
        end
      end
    end
  end
end
