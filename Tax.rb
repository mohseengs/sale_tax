class Tax

    protected 

    def self.get_tax_ammount(tax_p, price)

        puts "% #{tax_p} , price #{price}"
        p = tax_p.to_i / 100.0
        return price * p
    end
    
    def self.get_totall_amount(tax_p, price)
        return get_tax_ammount(tax_p, price) + price
    end
    
end

p Tax.get_tax_ammount(10,100)