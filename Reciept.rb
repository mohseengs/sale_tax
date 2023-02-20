require_relative "Tax.rb"
class Reciept
    def create(products)
        @products = products
        @totall_amount = 0
        @tax_applied
    end 
    def process
        @products.each do |product , stock|
            @totall += Tax.get_tax_ammount(product.tax,product.price) + (product.price * value)
            @tax_applied += Tax.get_ammount_include_tax(product.tax,product.price)
        end

    end

    def show
        for product in products
            puts "#{product.name}       #{product.price}"
        end
    end

    puts "==============================================="
    puts "TOTAL :                           #{@totall_amount}"
    puts "TAX :                           #{@tax_applied}"
end