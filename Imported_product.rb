require_relative "Product.rb"

class Imported_product < Product
    def initialize(name, price, stocks,tax = 15)
        super(name,price,stocks)
        @tax = 15
    end
end
