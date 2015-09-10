  require 'sinatra'
  require 'json'
  
  configure do
    enable :sessions
    GlobalState = {} 
    GlobalState[:x] = GlobalState[:y] = 0
  end
  
  get '/hi' do
    "Hello World!"
  end

  get '/slider' do
    send_file 'slider.html'
  end
 
  post '/session' do
	GlobalState[:x] = params[:x].to_f
	GlobalState[:y] = params[:y].to_f
	puts GlobalState.inspect
    #session[:xcoordinate].to_json
 end

  get '/session' do
    data = {
	  :x => GlobalState[:x], 
	  :y => GlobalState[:y]
    }
    data.to_json
  end
 