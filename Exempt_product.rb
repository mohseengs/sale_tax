require_relative "Product.rb"

class Exempt_product < Product
    def initialize(name, price,stocks)
        super(name,price,stocks)
        @type = "Exempt"
        @tax = 0
    end
end
