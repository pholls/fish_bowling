User.delete_all
Team.delete_all
Game.delete_all
Round.delete_all
Card.delete_all
RoundType.delete_all
Turn.delete_all

kim = User.create!( display_name: 'kim',
                    email: 'kim@email.com',
                    password: 'password' )
katherine = User.create!( display_name: 'katherine',
                    email: 'katherine@email.com',
                    password: 'password' )
justin = User.create!( display_name: 'justin',
                    email: 'justin@email.com',
                    password: 'password' )
pat = User.create!( display_name: 'pat',
                    email: 'pat@email.com',
                    password: 'password' )


50.times do |time|
  game = Game.new(name: "Otters#{time}")
  game.creator = pat
  game.participants << [kim, katherine, justin, pat]
  game.save!
  game.participants.each do |participant|
    4.times do
      card = participant.cards.new(concept: Faker::Pokemon.name)
      game.cards << card
    end
  end
end

DBC_CARDS = ['Stu',
             'Jordan',
             'Cyberspace',
             'The Information Superhighway',
             'Asynchronous',
             'RSpec',
             'TDD',
             'Otters',
             'Czar',
             'Agile workflow',
             'Commit messages',
             'GitHub',
             '500 Internal Server Error',
             'Engineering Empathy',
             'Star Wars',
             'Kanto region'].shuffle


game = Game.new(name: "Demo")
game.creator = pat
game.participants << [kim, katherine, justin, pat]
game.save!
game.participants.each_with_index do |participant, index|
  4.times do |time|
    card = participant.cards.new(concept: DBC_CARDS[time + index])
    game.cards << card
  end
end
