require "sinatra"
require_relative "make_order.rb" 

get '/' do 
erb	:sandwich_parts
end

post '/sandwich_parts' do

	toppings = params[:toppings].to_s
	toppings_with_join_method = params[:toppings].join(',')
	p "what does toppings.to_s look like: #{toppings}"
	p "what if instead i use toppings.join(',') #{toppings_with_join_method}"
	 redirect'/order?toppings=' + toppings_with_join_method
end
get '/order' do

	toppings = params[:toppings].split(',')
	erb :order, :locals=> {:toppings => toppings}
end
post '/order' do
	 inputs = params.values.join(',')
	 p "#{inputs.class}what class is this"
	
	  redirect '/confimation?toppings=' + inputs
	
end
get  '/confimation'do
puts "MADE IT TO get confimation DO"
	toppings = params[:toppings].split(',')
	puts "TOPPINGS + #{toppings}"
	# value = params[:value].split
	erb :confimation, :locals => {:toppings => toppings}
end
