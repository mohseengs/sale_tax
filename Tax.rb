class Tax

    protected 

    def self.get_tax_ammount(tax_p, price)
        p = tax_p / 100.0
        puts p
        return price * p
    end
    
    def self.get_totall_amount(tax_p, price)
        return get_tax_ammount(tax_p, price) + price
    end
    
end