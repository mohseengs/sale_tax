require_relative "Exempt_product.rb"
require_relative "Imported_product.rb"
require_relative "Product.rb"
require_relative "Tax.rb" 
class Shop < Tax

    def initialize
        @imported_products = Hash.new
        @products = Hash.new
        @exempt_product = Hash.new
        show_menu
    end    

    def add_extemp_product(name, price)
        exempt_products[name] = Exempt_product.new(name,price)
    end

    def add_imported_product(name, price)
        imported_products[name] = Exempt_product.new(name,price)
    end

    def add_product(name, price)
        products[name] = Exempt_product.new(name,price)
    end

    def show_menu
        p "welcome"
        p "1 : if you are owener"
        p "2 : if you are customer"
        p "quit"

       
        input = -1
        while(input != 0)

            input = gets.chomp.to_i
            case input
        
            when 1 then show_owner_options
            when 2 then show_customer_options
            when 0 then break

            end
        
        end
        
    end

    def show_owner_options

        p "welcome"
        p "1 : add items"
        p "2 : remove items"
        p "3 : view items"
        p "go back"

       
        input = -1
        while(input != 0)

            input = gets.chomp.to_i
            case input
        
            when 1 then add_items
            when 2 then remove_items
            end
        end

        show_menu
    end


    
    def add_items
        system("clear")
        input = 1
        while(input == 1)
            puts "enter product name"
            name = gets.chomp
    
            puts "enter price"
            price = gets.chomp.to_i
    
            puts "enter stocks"
            stocks = gets.chomp.to_i
    
            puts "choose option : "
            puts "1 : Normal product"
            puts "2 : Imported product"
            puts "2 : Exempt product"
    
            type = gets.chomp.to_i
            
            case type
                when 1 then @products[name] = Product.new(name, price, stocks)   
                when 2 then @imported_products[name] = Imported_product.new(name, price, stocks) 
                when 3 then @exempt_products[name] = Exempt_product.new(name, price, stocks) 
                else 
                    puts "wrong choice try again"
                    break
            end  
            puts @imported_products
            puts @products
            puts @exempt_products
            puts "1 : add more"
            puts "0 : quit"
    
            input = gets.chomp.to_i
    
        end
    
    
    end



    def show_customer_options

        p "welcome"
        p "1 : buy items"
        p "2 : print reciept"
        p "go back"

       
        input = -1
        while(input != 0)

            input = gets.chomp.to_i
            case input
        
            when 1 then buy_items
            when 2 then print_reciept
            when 0 then break

            end
        end
        show_menu
    end


    def show_products(products)


        for product in products.values
           
            puts "#{product.name}       #{product.stock}        #{product.price}"
        end 
        
    end

    def buy_items
        products = Hash.new
        system("clear")
        input = 1
        while(input == 1)
            system("clear")

            if(@imported_products.size > 0)
                show_products(@imported_products)
            elsif(@products.size > 0)
                show_products(@products)
            elsif(exempt_products.size > 0)
                show_products(@exempt_products)
            else 
                puts "no items to show"
                
            end
            
            want_to_add = "Y"
            while(want_to_add == "Y" || want_to_add == "y")
                puts "select product to buy"
                product_name = gets.chomp
                
                puts "how many you want"
                stock = gets.chomp

                if (@products[product_name].stock < stock)
                    puts "stocks out!!!"
                    puts "want to add more? Y/N"
                    want_to_add gets.chomp
                    next

                end
                @products[product_name].stock -= stock
                product[@products[product_name]] = stock

                products.push(product)
                @products[products.name].stock - stock
                puts "want to add more"
                want_to_add gets.chomp
            end
         
            Reciept.new(@products)

            

            #type = gets.chomp.to_i
            
            # case type
            #     when 1 then @products[name] = Product.new(name, price, stocks)   
            #     when 2 then @imported_products[name] = Imported_product.new(name, price, stocks) 
            #     when 3 then @exempt_products[name] = Exempt_product.new(name, price, stocks) 
            #     else 
            #         puts "wrong choice try again"
            #         break
            # end  
            # puts @imported_products
            # puts @products
            # puts @exempt_products
            # puts "1 : add more"
            # puts "0 : quit"
    
            input = gets.chomp.to_i
    
        end
    
    
    end


end



puts "running"
shop = Shop.new

