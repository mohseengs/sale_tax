class Product

    attr_accessor :name, :price, :stock, :tax, :type
    def initialize(name, price, stock = 1)
        @name = name
        @price = price
        @stock = stock
        @tax = 10
        @type = "Normal"
    end
end



