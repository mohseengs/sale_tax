require_relative "Product.rb"

class Imported_product < Product
    @@tax  = 15;
    def Imported_product(name, price)
        super(name,price)
    end
end
