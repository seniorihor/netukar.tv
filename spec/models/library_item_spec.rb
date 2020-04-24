require 'rails_helper'

RSpec.describe LibraryItem, type: :model do
  describe '.search_or_create' do
    let(:user) { FactoryBot.create(:user, email: 'forrest_gump@gmail.com') }
    let(:movie) { FactoryBot.create(:movie, title: 'The Shawshank Redemption', plot: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.') }
    let(:purchase_option) { FactoryBot.create(:purchase_option, price: 9.99, video_quality: 'HD') }
    let(:purchase_params) do
      {
        'user_id' => user.id,
        'gallery_item_id' => movie.id,
        'purchase_option_id' => purchase_option.id
      }
    end

    subject(:search_or_create) { LibraryItem.search_or_create(purchase_params) }

    context 'when a new library item has been added to the user library' do
      it 'returns successful message' do
        expect(search_or_create).to eq({ message: 'Purchase successful.' })
      end
    end

    context 'When non existing user id passed' do
      let(:params_with_invalid_user) do
        purchase_params['user_id'] = 0
        purchase_params
      end

      subject(:search_or_create) { LibraryItem.search_or_create(params_with_invalid_user) }

      it 'returns an error message' do
        expect(search_or_create).to eq({ status: 404, messages: ['User must exist'] })
      end
    end

    context 'When non existing season or movie id passed' do
      let(:params_with_invalid_movie) do
        purchase_params['gallery_item_id'] = 0
        purchase_params
      end

      subject(:search_or_create) { LibraryItem.search_or_create(params_with_invalid_movie) }

      it 'returns an error message' do
        expect(search_or_create).to eq({ status: 404, messages: ['Gallery item must exist'] })
      end
    end

    context 'When non existing purchase option id passed' do
      let(:params_with_invalid_purchase_option) do
        purchase_params['purchase_option_id'] = 0
        purchase_params
      end

      subject(:search_or_create) { LibraryItem.search_or_create(params_with_invalid_purchase_option) }

      it 'returns an error message' do
        expect(search_or_create).to eq({ status: 404, messages: ['Purchase option must exist'] })
      end
    end

    context 'When user tries to purchase a library item which is alive in his library' do
      let(:add_to_user_library) { LibraryItem.search_or_create(purchase_params) }

      subject(:search_or_create) do
        add_to_user_library
        LibraryItem.search_or_create(purchase_params)
      end

      it 'returns message about alive subscription' do
        expect(search_or_create).to eq({ message: 'You still have a valid subscription for 2 days.' })
      end
    end
  end
end
