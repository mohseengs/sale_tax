require_relative "Tax.rb"
require_relative "Product"
require_relative "utils.rb"
class Reciept
    include Manage_width_for_col
    def create(products)
        @products = products
        @totall_amount = 0
        @tax_applied = 0
        @totall_amount_without_tax = 0
        @max_width = 7
    end 
    def process
        @products.each do |product , stock|
            @totall_amount += Tax.get_tax_ammount(product.tax,product.price * stock) + (product.price * stock)
            @tax_applied += Tax.get_tax_ammount(product.tax,product.price * stock) 
            @totall_amount_without_tax += product.price * stock
        end

    end

    # def crop_string(str)
   
    #     if(str.size > @max_width)
    #         return str[0,@max_width - 3] +"..."
    #     else
    #         puts "else called"
    #         spaces = (" "*(@max_width - str.size))
            
    #         return (str << spaces << ".")
    #     end
    # end

    def show
        system("clear")

        puts "#{crop_string("product name")} #{crop_string("type")} #{crop_string("price")} #{crop_string("quantity")} #{crop_string("amount")} #{crop_string("tax")}"
        puts "."*60
        puts
        @products.each do |product , stock|
            puts "#{crop_string(product.name)} #{crop_string(product.type)} #{crop_string(product.price.to_s)} #{crop_string(stock.to_s)} #{crop_string((stock * product.price).to_s)} #{crop_string(Tax.get_tax_ammount(product.tax,product.price * stock).to_s)}"

        end
        puts "."*35
        puts "TOTAL :                           #{@totall_amount}"
        puts "TAX :                             #{@tax_applied}"
    end

end
