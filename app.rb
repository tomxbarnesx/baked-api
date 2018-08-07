require 'sinatra'
require 'sinatra/reloader'
require './classes.rb'

baked = Bakery.new("Baked")

baked.add_item(Cake.new("Lemon Layer", 30, ["cake", "citrus", "fruit", "frosted"], "Turn off your mind, relax and eat cake", "/images/lemonlayer.png"))
baked.add_item(Cake.new("Coconut Cream", 35, ["cake", "coconut", "frosted"], "Say hello to our little friend.", "/images/coconut.png"))
baked.add_item(Cake.new("Raspberry Swirl", 40, ["cake", "fruit", "berry", "Frosted"], "A far out swirl like no other.", "/images/raspberry.png"))
baked.add_item(Cookie.new("Chocolate Chip", 10, ["cookie", "chocolate", "chip"], "God is a cookie.", "/images/chocolatechip-square.jpg"))
baked.add_item(Cookie.new("Chocolate Blackout", 10, ["cookie", "chocolate"], "Keep away from dog.", "/images/chocolateblackout-square.jpg"))
baked.add_item(Cookie.new("Snickerdoodle", 10, ["cookie", "cinnamon", "candy", "Scicy"], "Spiced out until the lights out.", "/images/snickerdoodle-square.jpg"))
baked.add_item(Muffin.new("Chocolate Chip", 10, ["muffin", "chocolate"], "Dark, mysterious, extremely sexy.", "/images/chocolatemuffin-square.jpg"))
baked.add_item(Muffin.new("Orange-Cranberry", 10, ["muffin", "cranberry"], "Tangy like them orangutans.", "/images/cranberrymuff-square.jpg"))
baked.add_item(Muffin.new("Ginger Peach", 10, ["muffin", "ginger", "peach"], "Cures cancer.", "/images/peach-square.jpg"))



get "/" do 
    erb :index
end

get "/cakes" do
    @cake_stock = baked.stock.select {|item| item.tags[0] == "cake"}
    erb :cakes
end

get "/cookies" do
    @cookie_stock = baked.stock.select {|item| item.tags[0] == "cookie"}
    erb :cookies
end

get "/muffins" do
    @muffin_stock = baked.stock.select {|item| item.tags[0] == "muffin"}
    erb :muffins
end

get "/recipes" do
    erb :recipes
end

post '/searchapi' do
    pick = params["pick_an_option"]
    if pick === "ingredient"
        response = HTTParty.get("https://api.edamam.com/search?q=${params[:id]&app_id=${APP_ID}&app_key=${APP_KEY})
    elsif pick === "quick_search" 
        response = HTTParty.get("https://api.edamam.com/search?q=")
    end
end

# "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=591-722&health=alcohol-free"