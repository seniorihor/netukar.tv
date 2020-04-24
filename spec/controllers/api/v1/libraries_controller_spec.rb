require 'rails_helper'

RSpec.describe Api::V1::LibrariesController, type: :controller do
  describe '#index' do
    context 'Invalid user' do
      let(:user_id) { 13 }

      it 'returns an error message' do
        get :index, params: { user_id: user_id }
        expect(JSON.parse(response.body)).to eq({ 'status' => 404, 'error' => "User with id #{user_id} not found" })
      end
    end

    context 'Valid user' do
      let(:user) { FactoryBot.create(:user, email: 'forrest_gump@gmail.com') }

      it 'returns an empty array' do
        get :index, params: { user_id: user.id }
        expect(JSON.parse(response.body)).to eq([])
      end
    end
  end
end
