module Manage_width_for_col

    MAX_WITDH = 10

    def crop_string(str)
   
        if(str.size > MAX_WITDH)
            return str[0,MAX_WITDH - 3] +"..."
        else
            spaces = (" "*(MAX_WITDH - str.size))
            
            return (str << spaces)
        end
    end

end