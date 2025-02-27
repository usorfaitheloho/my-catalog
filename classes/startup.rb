require './actions/game_actions'
require_relative 'music_actions'

class Startup
  def initialize
    @game_actions = GameActions.new
    @music_actions = MusicActions.new
  end

  def options_list
    puts "\nPlease choose an option by selecting a number:
    1. List all books
    2. List all musics
    3. List of games
    4. List all lables
    5. List all genre
    6. List all authors
    7. Add a book
    8. Add a music
    9. Add a game
    10. Exit"
    choice = gets.chomp
    selection(choice.to_i)
  end

  def selection(choice)
    methods = [
      method(:booklist), method(:musiclist), method(:gamelist),
      method(:lablelist), method(:genrelist), method(:authorlist),
      method(:create_book), method(:create_music), method(:create_game),
      method(:quite_app)
    ]
    (1..10).include?(choice) && methods[choice - 1].call
  end

  def booklist
    puts 'book list in library'
  end

  def musiclist
    @music_actions.list_musics
  end

  def gamelist
    @game_actions.list_games
  end

  def lablelist
    puts 'Labels in library'
  end

  def genrelist
    @music_actions.list_genres
  end

  def authorlist
    @game_actions.list_authors
  end

  def create_book
    puts 'create book'
  end

  def create_music
    @music_actions.add_a_music
  end

  def create_game
    @game_actions.add_a_game
  end

  def quite_app
    @game_actions.save_games
    @game_actions.save_authors
    @music_actions.save_musics
    @music_actions.save_genres
    puts 'Thanks for using our app'
    exit
  end

  def start
    options_list
  end
end
