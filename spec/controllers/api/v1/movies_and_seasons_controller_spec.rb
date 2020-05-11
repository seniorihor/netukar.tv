require 'rails_helper'

RSpec.describe Api::V1::MoviesAndSeasonsController, type: :controller do
  describe "#index" do
    let(:movies) do
      [
        { title: 'The Shawshank Redemption', plot: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.' },
        { title: 'The Godfather', plot: 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.' },
        { title: 'The Dark Knight', plot: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.' },
        { title: 'The Godfather: Part II', plot: 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.' },
        { title: 'Pulp Fiction', plot: 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.' },
        { title: "Schindler's List", plot: 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.' },
        { title: 'The Lord of the Rings: The Return of the King', plot: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring." },
        { title: '12 Angry Men', plot: 'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.' },
        { title: 'The Good, the Bad and the Ugly', plot: 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.' },
        { title: 'Forrest Gump', plot: 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.' }
      ]
    end

    before { movies.each { |movie| FactoryBot.create(:movie, movie) } }

    it 'returns the movies and seasons' do
      get :index
      expect(JSON.parse(response.body).map(&:keys)[0]).to eq(%w[id title plot type purchase_options])
    end
  end
end
