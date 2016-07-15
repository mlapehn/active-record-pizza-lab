class PizzaShop < Sinatra::Base
	require 'json'
		#index
		get "/pizzas" do
			pizzas = Pizza.all.to_json
		end
		#show
		post "/pizzas" do
		new_pizza = JSON.parse request.body.read
		pizza.create
		end
		#create
		get "/pizzas/:id" do
			pizzas = Pizza.find(params[:id]).to_json
		end
		#update
		put "/pizzas/:id" do
			attributes_to_update = JSON.parse(request.body.read)
			pizza = Pizza.find(params[:id])
			pizza.update_attributes(attributes_to_update)
		end
		#delete
		delete "/pizzas/:id" do
			pizza = Pizza.find(params[:id])
			pizza.destroy
		end

end
