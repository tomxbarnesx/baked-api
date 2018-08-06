class Bakery
    attr_accessor :name, :stock
    def initialize(name)
        @name = name
        @stock = []
    end

    def add_item(item)
        @stock.push(item)
    end
end

class Cake
    attr_accessor :flavor, :price, :tags, :description, :image_url

    def initialize(flavor, price, tags, description, image_url)
        @flavor = flavor
        @price = price
        @tags = tags
        @description = description
        @image_url = image_url
    end
end

class Cookie < Cake
end

class Muffin < Cake
end