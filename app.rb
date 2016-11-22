require 'sinatra'
require 'rubygems'
require_relative 'random_ai.rb'
require_relative 'unbeatable_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'new_board.rb'
require_relative 'console_human.rb'

enable :sessions

ai = ""


get '/' do
    session[:board] = Board.new(["","","","","","","","",""])
    erb :home, :layout => :home_layout, :locals => { :board => session[:board].board_positions }
end

# get '/player_1_name' do
#     erb :player_1_name, :layout => :home_layout, :locals => { :board => session[:board].board_positions }
# end

post '/game' do
	session[:player_1_name] = params[:player_1].capitalize
	session[:p1] = Human.new("X")
    session[:current_player] = session[:p1]
    session[:current_player_name] = session[:player_1_name]

    erb :choose_opponent, :layout => :home_layout, :locals => { :board => session[:board].board_positions, :player_1_name => session[:player_1_name] }

    # redirect '/choose_opponent'
end

# get '/opponent_type' do
#   erb :choose_opponent
# end


post '/opponent' do
	player_2 = params[:player_2].capitalize
         if player_2 == "human"
           session[:p2] = Human.new("O") 
           erb :player_2_name, :layout => :home_layout, :locals => { :board => session[:board].board_positions }

		   redirect '/player_2_name'

	# elsif player_2 == "sequential_ai"
	# 	session[:p2] = SequentialAI.new("O")
	# 	session[:name_player_2] = "Computer"

	# 	redirect '/get_move'

	# elsif player_2 == "random_ai"
	# 	session[:p2] = RandomAI.new("O")
	# 	session[:name_player_2] = "Computer"

	# 	redirect '/get_move'

	# else player_2 == "unbeatable_ai"
	# 	session[:p2] = UnbeatableAI.new("O")
	# 	session[:name_player_2] = "Computer"

	# 	redirect '/get_move'
	end
end


get '/player_2_name' do
    erb :player_2_name, :layout => :home_layout, :locals => { :board => session[:board].board_positions }
end

post '/player_2_name' do
    session[:player_2_name] = params[:player_2_name].capitalize
	redirect '/get_move'
end

# get '/play_game' do
#     session[:player_1_name] = params[:player_1]
# 	session[:player_2_name] = params[:player_2]
#     session[:player_1] = Console_human.new("X")
#     session[:current_player] = session[:player_1]
#     session[:current_player_name] = session[:player_1_name]

#     erb :play_game, :layout => :home_layout, :locals => { :board => session[:board].grid, :current_player_name => session[:current_player_name], :player_1_name => session[:player_1_name], :player_2_name => session[:player_2_name]}
#     #the above saves your board and lets you pull it everytime you call it?  Pushes your board into the erb.  

#     # redirect '/get_move'
# end

get '/get_move' do
	# session[:board] = Board.new(["","","","","","","","",""])
	# session[:board] = session[:board].board_positions
	# session[:player_1] = params[:player_1]
	# session[:player_2] = params[:player_2]
	# session[:player_1_name] = session[:player_1]
	# session[:player_2_name] = session[:player_2]

	move = session[:current_player].get_move(session[:board].grid)
    
	if move == "NO"
	erb :get_move, :locals => { :current_player => session[:current_player], :current_player_name => session[:current_player_name], :board => session[:board].board_positions }
        
        
    	elsif session[:board].valid_space?(move)
            redirect '/make_move' #+ move.to_s 
        else
        	redirect '/get_move'
	end
end

post '/get_player_move' do
	session[:board] = session[:board]
    move = params[:square].to_i

    if session[:board].valid_space?(move)
        redirect '/make_move' #+ move.to_s
    else
        redirect '/get_move'
    end
end

get '/make_move' do
	move_spot = params[:square].to_i

	session[:board].update((move_spot), session[:current_player].marker)

	# if session[:board].winner?(session[:current_player].marker) == true
	# 	player_1 = session[:player_1_name]
	# 	player_2 = session[:player_2_name]
	# 	winner = session[:current_player_name]

	# 	erb :win, :locals => { :current_player => session[:current_player], :current_player_name => session[:current_player_name], :board => session[:board].grid }

	# elsif session[:board].full_board? == true
	# 	player_1 = session[:player_1_name]
	# 	player_2 = session[:player_2_name]
	# 	winner = "Tie"

	# 	erb :tie, :locals => { :board => session[:board].grid }

	# else
		if session[:current_player].marker == "X"
			session[:current_player] = session[:player_2]
			session[:current_player_name] = session[:player_2_name]
		else
			session[:current_player] = session[:player_1]
			session[:current_player_name] = session[:player_1_name]
		end

		redirect '/get_move'
	# end	
end
# end

# get '/play_game' do
#     erb :play_game, :locals => {:board => session[:board].board, :player_1_name => session[:player_1_name], :player_2_name => session[:player_2_name]}
# #     #the above saves your board and lets you pull it everytime you call it?  Pushes your board into the erb.  This is why mob helps i would have spent hours on that
# end