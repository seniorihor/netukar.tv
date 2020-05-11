require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.resource 'Movies and Seasons' do
  route '/api/v1/movies_and_seasons', 'An endpoint to return both movies and seasons, ordered by creation' do

    get 'index' do
      context 'When movies and seasons are exist' do
        let!(:movie) { FactoryBot.create_list(:movie, 10) }

        example_request 'Get movies and seasons list' do
          expect(status).to eq(200)
          expect(JSON.parse(response_body).size).to eq(10)
        end
      end
    end
  end
end
