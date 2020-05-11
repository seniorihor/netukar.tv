# coding: utf-8

users = [
  { email: 'ihor@gmail.com' },
  { email: 'guest@gmail.com' }
]
User.create(users)

purchase_options_data = [
  { price: 2.99, video_quality: 'HD' },
  { price: 1.99, video_quality: 'SD' }
]
purchase_options = PurchaseOption.create(purchase_options_data)

movies_data = [
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
movies = Movie.create(movies_data)

movies.each do |movie|
  purchase_options.each do |purchase_option|
    movie.purchase_options << purchase_option
    movie.save
  end
end

seasons_with_episodes = [
  {
    { title: 'Simpsons', plot: 'Season 1 (1989–90)' } =>
    [
      { number: 1,  title: "Simpsons Roasting on an Open Fire", plot: 'December 17, 1989' },
      { number: 2,  title: "Bart the Genius", plot: 'January 14, 1990' },
      { number: 3,  title: "Homer's Odyssey", plot: 'January 21, 1990' },
      { number: 4,  title: "There's No Disgrace Like Home", plot: 'January 28, 1990' },
      { number: 5,  title: "Bart the General", plot: 'February 4, 1990' },
      { number: 6,  title: "Moaning Lisa", plot: 'February 11, 1990' },
      { number: 7,  title: "The Call of the Simpsons", plot: 'February 18, 1990' },
      { number: 8,  title: "The Telltale Head", plot: 'February 25, 1990' },
      { number: 9,  title: "Life on the Fast Lane", plot: 'March 18, 1990' },
      { number: 10, title: "Homer's Night Out", plot: 'March 25, 1990' },
      { number: 11, title: "The Crepes of Wrath", plot: 'April 15, 1990' },
      { number: 12, title: "Krusty Gets Busted", plot: 'April 29, 1990' },
      { number: 13, title: "Some Enchanted Evening", plot: 'May 13, 1990' }
    ],
    { title: 'South Park', plot: 'Season 1 (1997–98)' } =>
    [
      { number: 1,  title: "Cartman Gets an Anal Probe", plot: 'August 13, 1997' },
      { number: 2,  title: "Weight Gain 4000", plot: 'August 20, 1997' },
      { number: 3,  title: "Volcano", plot: 'August 27, 1997' },
      { number: 4,  title: "Big Gay Al's Big Gay Boat Ride", plot: 'September 3, 1997' },
      { number: 5,  title: "An Elephant Makes Love to a Pig", plot: 'September 10, 1997' },
      { number: 6,  title: "Death", plot: 'September 17, 1997' },
      { number: 7,  title: "Pinkeye", plot: 'October 29, 1997' },
      { number: 8,  title: "Starvin' Marvin", plot: 'November 19, 1997' },
      { number: 9,  title: "Mr. Hankey, the Christmas Poo", plot: 'December 17, 1997' },
      { number: 10, title: "Damien", plot: 'February 4, 1998' },
      { number: 11, title: "Tom's Rhinoplasty", plot: 'February 11, 1998' },
      { number: 12, title: "Mecha-Streisand", plot: 'February 18, 1998' },
      { number: 13, title: "Cartman's Mom Is a Dirty Slut", plot: 'February 25, 1998' }
    ]
  }
]

seasons_with_episodes.each do |season_with_episodes|
  season_with_episodes.each do |season, episodes|
    s = Season.create(season)
    s.episodes.create(episodes)

    purchase_options.each do |purchase_option|
      s.purchase_options << purchase_option
      s.save
    end
  end
end
