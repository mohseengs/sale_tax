require_relative "Tax.rb"
require_relative "Product"
class Reciept
    def create(products)
        @products = products
        @totall_amount = 0
        @tax_applied = 0
        @totall_amount_without_tax = 0
    end 
    def process
        @products.each do |product , stock|
            @totall_amount += Tax.get_tax_ammount(product.tax,product.price * stock) + (product.price * stock)
            @tax_applied += Tax.get_tax_ammount(product.tax,product.price * stock) 
            @totall_amount_without_tax += product.price * stock
        end

    end

    def show
        system("clear")

        puts "PRODUCT NAME      PRODUCT PRICE       NO OF ITEM        AMOUNT      TAX ADDED"

        @products.each do |product , stock|
            puts "#{product.name}   #{product.class.name}    #{product.price}        #{stock}        #{stock * product.price}      #{ Tax.get_tax_ammount(product.tax,product.price * stock) }"

        end

        puts "==============================================="
        puts "TOTAL :                           #{@totall_amount}"
        puts "TAX :                             #{@tax_applied}"
    end

end