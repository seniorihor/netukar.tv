require 'rails_helper'

RSpec.describe Api::V1::PurchasesController, type: :controller do
  describe '#create' do
    let(:user) { FactoryBot.create(:user, email: 'forrest.gump@gmail.com') }
    let(:movie) { FactoryBot.create(:movie, title: 'The Shawshank Redemption', plot: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.') }
    let(:purchase_option) { FactoryBot.create(:purchase_option, price: 9.99, video_quality: 'HD') }
    let(:params) do
      {
        'purchase' => {
          'user_id' => user.id,
          'gallery_item_id' => movie.id,
          'purchase_option_id' => purchase_option.id
        }
      }
    end

    context 'When non existing user id is passed' do
      let(:params_with_invalid_user) do
        params['purchase']['user_id'] = 13
        params
      end

      it 'returns an error message' do
        post :create, params: params_with_invalid_user
        expect(JSON.parse(response.body)).to eq({ 'status' => 404, 'messages' => ['User must exist'] })
      end
    end

    context 'When non existing season or movie id is passed' do
      let(:params_with_invalid_movie) do
        params['purchase']['gallery_item_id'] = 0
        params
      end

      it 'returns an error message' do
        post :create, params: params_with_invalid_movie
        expect(JSON.parse(response.body)).to eq({ 'status' => 404, 'messages' => ['Gallery item must exist'] })
      end
    end

    context 'When non existing purchase option id is passed' do
      let(:params_with_invalid_purchase_option) do
        params['purchase']['purchase_option_id'] = 0
        params
      end

      it 'returns an error message' do
        post :create, params: params_with_invalid_purchase_option
        expect(JSON.parse(response.body)).to eq({ 'status' => 404, 'messages' => ['Purchase option must exist'] })
      end
    end

    context 'When all params are valid' do
      it 'should return purchase success message' do
        post :create, params: params
        expect(JSON.parse(response.body)).to eq({ 'message' => 'Purchase successful.' })
      end
    end

    context 'When user purchased an item already' do
      let(:create_library_item) do
        FactoryBot.create(:library_item,
          user_id: user.id,
          gallery_item_id: movie.id,
          purchase_option_id: purchase_option.id,
          expires_at: Time.now + 2.days
        )
      end

      it 'returns valid duration' do
        create_library_item
        post :create, params: params
        expect(JSON.parse(response.body)).to eq({ 'message' => 'You still have a valid subscription for 2 days.'})
      end
    end
  end
end
