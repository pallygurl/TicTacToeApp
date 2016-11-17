require 'sinatra'
require 'rubygems'
require_relative 'random_ai.rb'
require_relative 'unbeatable_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'board.rb'

enable :sessions

ai = ""


get '/' do
    board = Board.new
    #session[:board] = Board.board
    erb :home
end

get '/player_1_name' do
    erb :player_1_name
end

post '/player_1_name' do
	session[:player_1_name] = params[:player_1_name]
	redirect '/player_2_name'
end

# get '/choose_opponent' do
# 	p1 = params[:player_1].capitalize
#     erb :choose_opponent, :locals => {:board.board => board, :player_1 => p1}
# end

# post '/choose_opponent' do
#     opponent = params[:opponent]
#         if opponent == "1"
#           session[:p2] = Human.new("O") 
#           erb :choose_opponent, :locals => { :board => session[:board].board_position }

# 	elsif player_2 == "2"
# 		session[:p2] = SequentialAI.new("O")
# 		session[:name_player_2] = "Computer"

# 		redirect '/get_move'

# 	elsif player_2 == "3"
# 		session[:p2] = RandomAI.new("O")
# 		session[:name_player_2] = "Computer"

# 		redirect '/get_move'

# 	else player_2 == "4"
# 		session[:p2] = UnbeatableAI.new("O")
# 		session[:name_player_2] = "Computer"

# 		redirect '/get_move'
# 	end
# end


get '/player_2_name' do
    erb :player_2_name
end

post '/player_2_name' do
    session[:player_2_name] = params[:player_2_name]
	redirect '/play_game'
end

get '/play_game' do
    erb :play_game, :locals => {:board => session[:board].board, :player_1_name => session[:player_1_name], :player_2_name => session[:player_2_name]}
#     #the above saves your board and lets you pull it everytime you call it?  Pushes your board into the erb.  This is why mob helps i would have spent hours on that
end