25.times do
  User.create!(username: Faker::Internet.user_name,email: Faker::Internet.free_email,password: "password")
end

rand(1..5).times do
  user = User.find(rand(1..25))
  user.admin_privileges = true
end

Game.create!([{title: "Durak",description: Faker::Lorem.paragraph,min_players: 2,max_players: 6,average_time: 10,image_url:"https://upload.wikimedia.org/wikipedia/commons/2/27/Regular_Durak.JPG"},
  {title: "Chess",description: Faker::Lorem.paragraph,min_players: 2,max_players: 2,average_time: 60,image_url:"https://upload.wikimedia.org/wikipedia/commons/c/c3/Chess_board_opening_staunton.jpg"},
  {title: "Sorry!",description: Faker::Lorem.paragraph,min_players: 2,max_players: 4,average_time: 40,image_url:"http://i.walmartimages.com/i/p/00/07/30/00/00/0007300000390_500X500.jpg"},
  {title: "Risk",description: Faker::Lorem.paragraph,min_players: 2,max_players: 6,average_time: 240,image_url:"http://gamevuze.com/wp-content/uploads/2014/03/Risk.jpg"},
  {title: "Bridge",description: Faker::Lorem.paragraph,min_players: 4,max_players: 4,average_time: 60,image_url:"https://upload.wikimedia.org/wikipedia/commons/9/9d/Bridge_played_cards_after_game.jpg"},
  {title: "Scattergories",description: Faker::Lorem.paragraph,min_players: 2,max_players: 6,average_time: 40,image_url:"https://upload.wikimedia.org/wikipedia/en/a/a7/ScattergoriesBox.jpg"},
  {title: "Taboo",description: Faker::Lorem.paragraph,min_players: 4,max_players: 12,average_time: 30,image_url:"http://ecx.images-amazon.com/images/I/41MJURYyLOL._SY300_.jpg"},
  {title: "Life",description: Faker::Lorem.paragraph,min_players: 2,max_players: 6,average_time: 60,image_url:"http://wp.patheos.com.s3.amazonaws.com/blogs/friendlyatheist/files/2009/03/lifegame.jpg"},
  {title: "Monopoly",description: Faker::Lorem.paragraph,min_players: 2,max_players: 6,average_time: 120,image_url:"http://img.labnol.org/di/monopoly_HD.jpg"},
  {title: "Candyland",description: Faker::Lorem.paragraph,min_players: 2,max_players: 4,average_time: 60,image_url:"http://legendsrevealed.com/entertainment/wp-content/uploads/2010/10/candyland.jpg"},
  {title: "Mousetrap",description: Faker::Lorem.paragraph,min_players: 2,max_players: 4,average_time: 30,image_url:"http://www.hasbro.com/common/productimages/en_US/8f001bd66d4010148bf09efbf894f9d4/D8D5CDB919B9F3691055B01DA2CE120B.jpg"},
  {title: "Axis and Allies",description: Faker::Lorem.paragraph,min_players: 2,max_players: 5,average_time: 240,image_url:"https://upload.wikimedia.org/wikipedia/en/5/57/AxisAndAlliesBox.jpg"},
  {title: "Mancala",description: Faker::Lorem.paragraph,min_players: 2,max_players: 2,average_time: 20,image_url:"http://www.boardgamebeast.com/images/mancala-game.jpg"},
  {title: "Battleship",description: Faker::Lorem.paragraph,min_players: 2,max_players: 2,average_time: 60,image_url:"http://files.onset.freedom.com/ocregister/blogs/Crime_blog_photos/battleship.jpg"},
  {title: "Crossfire",description: Faker::Lorem.paragraph,min_players: 2,max_players: 2,average_time: 30,image_url:"http://ecx.images-amazon.com/images/I/51VZf3UTLcL._SX425_.jpg"},
  {title: "Hi Ho Cherry-O",description: Faker::Lorem.paragraph,min_players: 2,max_players: 4,average_time: 15,image_url:"http://c1.q-assets.com/images/products/p/hs/hs-021_1z.jpg"},
  {title: "Yahtzee",description: Faker::Lorem.paragraph,min_players: 1,max_players: 6,average_time: 60,image_url:"http://s.hswstatic.com/gif/yahtzee-2.jpg"},
  {title: "Cards Against Humanity",description: Faker::Lorem.paragraph,min_players: 3,max_players: 15,average_time: 60,image_url:"https://cf.geekdo-images.com/images/pic1104600.jpg"},
  {title: "Uno",description: Faker::Lorem.paragraph,min_players: 2,max_players: 10,average_time: 60,image_url:"http://www.licensemag.com/sites/www.licensingexpo.com/files/images/UnoGameShow.jpg"},
  {title: "Hungry Hungry Hippos",description: Faker::Lorem.paragraph,min_players: 2,max_players: 4,average_time: 20,image_url:"http://www.toysrus.com/graphics/product_images/pTRU1-2788805reg.jpg"},
  {title: "Clue",description: Faker::Lorem.paragraph,min_players: 2,max_players: 6,average_time: 60,image_url:"http://www.thealmightyguru.com/Reviews/Clue/Images/Clue-Game.jpg"},
  {title: "Arkham Horror",description: Faker::Lorem.paragraph,min_players: 1,max_players: 8,average_time: 60,image_url:"http://www.slj.com/wp-content/uploads/2013/05/ArkhamHorror.png"},
  {title: "Scotland Yard",description: Faker::Lorem.paragraph,min_players: 3,max_players: 6,average_time: 60,image_url:"http://img6a.flixcart.com/image/board-game/y/k/7/funskool-scotland-yard-400x400-imadhbs7fzvezdyy.jpeg"},
  {title: "Go",description: Faker::Lorem.paragraph,min_players: 2,max_players: 2,average_time: 60,image_url:"http://www.usgo.org/files/go-game.jpg"},
  {title: "Shogi",description: Faker::Lorem.paragraph,min_players: 2,max_players: 2,average_time: 60,image_url:"https://upload.wikimedia.org/wikipedia/commons/a/a6/Shogi_Ban_Koma.jpg"},
  {title: "Chutes and Ladders",description: Faker::Lorem.paragraph,min_players: 2,max_players: 4,average_time: 30,image_url:"http://www.toysit.com/chutes-and-ladders-game/chutes-and-ladders-game.jpg"},
  {title: "Stratego",description: Faker::Lorem.paragraph,min_players: 2,max_players: 2,average_time: 90,image_url:"http://www.toptenz.net/wp-content/uploads/2008/06/stratego.jpg"},
  {title: "Guess Who",description: Faker::Lorem.paragraph,min_players: 2,max_players: 2,average_time: 30,image_url:"http://stayonfountain.com/wp-content/uploads/2011/01/guess-who.jpg"},
  {title: "Trivial Pursuit",description: Faker::Lorem.paragraph,min_players: 2,max_players: 6,average_time: 120,image_url:"http://c1954342.cdn.cloudfiles.rackspacecloud.com/1251271660-1.jpg"},
  {title: "Scrabble",description: Faker::Lorem.paragraph,min_players: 2,max_players: 4,average_time: 60,image_url:"http://images.mentalfloss.com/sites/default/files/styles/article_640x430/public/377190790_dad_scrabble_0676.png"}])

Mechanic.create!([{trait: "Card"},{trait: "Strategy"},{trait:"Turn-Based"},{trait:"Guess"},{trait:"Party"},{trait:"Children's"}])

ordered_games = [[19,18,5,1],[4,2,12,27,23,24,25,30],[3,26,8,9,13,22],[14,17,21,28],[6,7],[20,11,10,16]]

6.times do |mechanic|
  ordered_games[mechanic].each do |game|
    GameFeature.create!(game_id: game, mechanic_id: mechanic + 1)
  end
end

50.times do
  Comment.create!(body: Faker::Hacker.say_something_smart,user_id: rand(1..25),game_id: rand(1..30))
end

users = User.all
games = Game.all

users.each do |user|
  owned_games = games.sample(rand(4..8))
  owned_games.each do |owned_game|
    user.games << owned_game
  end
end

users.each do |user|
  wanted_games = games.sample(rand(4..8))
  wanted_games.each do |wanted_game|
    user.wanted_games << wanted_game
  end
end

users.each do |user|
  voted_games_ids = (1..30).to_a.sample(15)
  voted_games_ids.each do |game_id|
    Vote.create!(user_id: user.id, votable_type: "Game", votable_id: game_id, value: [1,1,1, -1,1].sample)
  end
end


users.each do |user|
  voted_comments_ids = (1..50).to_a.sample(20)
  voted_comments_ids.each do |comment_id|
    Vote.create!(user_id: user.id, votable_type: "Comment", votable_id: comment_id, value: [1,1,1, -1,1].sample)
  end
end

users.each_with_index do |user, index|
  potential_buddies = (1..25).to_a - [index + 1]
  chosen_buddy_ids = potential_buddies.sample(rand(8..12))
  chosen_buddy_ids.each do |chosen_buddy_id|
    Relationship.create!(user_id: user.id, buddy_id: chosen_buddy_id)
  end
end

relationships = Relationship.all
relationships.each do |relationship|
  # Testing for mutual buddy relationships
  if Relationship.find_by(user_id: relationship.buddy_id, buddy_id: relationship.user_id)
    relationship.update(status: 1)
  end
end