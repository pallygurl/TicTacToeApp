require 'sinatra'
require 'rubygems'
require_relative 'random_ai.rb'
require_relative 'unbeatable_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'new_board.rb'
require_relative 'console_human.rb'
require_relative 'console_game.rb'

enable :sessions

ai = ""


get '/' do
    session[:board] = Board.new(["","","","","","","","",""])
    erb :home, :layout => :home_layout, :locals => { :board => session[:board].board_positions }
end

get '/player_1_name' do
    erb :player_1_name, :layout => :home_layout, :locals => { :board => session[:board].board_positions }
end

post '/player_1_name' do
	session[:player_1_name] = params[:player_1]
	session[:p1] = Console_human.new("X")
    session[:current_player] = session[:p1]
    session[:current_player_name] = session[:player_1_name]

    erb :choose_opponent, :layout => :home_layout, :locals => {:board => session[:board]}, :player_1_name => session[:current_player_name] }

    # redirect '/choose_opponent'
end

# get '/opponent_type' do
#   erb :choose_opponent
# end


post '/choose_opponent' do
	player_2 = params[:player_2]
         if player_2 == "Human"
           session[:p2] = Human.new("O") 
           erb :player_2_name, :layout => :home, :locals => { :board => session[:board].board_position }

	elsif player_2 == "2"
		session[:p2] = SequentialAI.new("O")
		session[:name_player_2] = "Computer"

		redirect '/get_move'

	elsif player_2 == "3"
		session[:p2] = RandomAI.new("O")
		session[:name_player_2] = "Computer"

		redirect '/get_move'

	else player_2 == "4"
		session[:p2] = UnbeatableAI.new("O")
		session[:name_player_2] = "Computer"

		redirect '/get_move'
	end
end


get '/player_2_name' do
    erb :player_2_name
end

post '/player_2_name' do
    session[:player_2_name] = params[:player_2_name]
	redirect '/play_game'
end

# get '/play_game' do
#     erb :play_game, :locals => {:board => session[:board].board, :player_1_name => session[:player_1_name], :player_2_name => session[:player_2_name]}
# #     #the above saves your board and lets you pull it everytime you call it?  Pushes your board into the erb.  This is why mob helps i would have spent hours on that
# end