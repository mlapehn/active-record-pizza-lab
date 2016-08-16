require 'json'
require "./models/pizza.rb"

class PizzaShop < Sinatra::Base
	# General route actions
	# Get Route
	get '/pizzas' do
		@all_pizzas = Pizza.all
		@all_pizzas.to_json
	end

	# Get Route
	get '/pizzas/:id' do
		@found_pizza = Pizza.find(params[:id])
		@found_pizza.to_json
	end

	# Create Route
	post '/pizzas' do
		request.body.rewind
        new_pizza = request.body.read
        parsed_pizza = JSON.parse(new_pizza)
		Pizza.create(parsed_pizza)
	end

	# Update Route
	put '/pizzas/:id' do
		new_pizza = request.body.read
		parsed_new_pizza = JSON.parse(new_pizza)
		@updating_pizza = Pizza.find(params[:id])
		@updating_pizza.update_attributes(parsed_new_pizza)
		redirect('/pizzas')
	end

	# Delete Route
	delete '/pizzas/:id' do
		@deleted_pizza = Pizza.find(params[:id])
		@deleted_pizza.destroy
		redirect('/pizzas')
	end
end