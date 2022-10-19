require 'pry'
class CashRegister
    attr_accessor :discount, :total, :title, :price, :quantity

    def initialize(discount = nil)
        @discount = discount
        @item_list = []
        @price_item = []
        @total = 0.0
    end
    
    def add_item (title, price, quantity = 1)
        @title = title
        @quantity = quantity
        quantity.times {|i| @item_list << title}
        @price_item << price*quantity
        self.total = @price_item.sum
    end

    def apply_discount
        if discount != nil
            self.total *= 1-self.discount.to_f/100
            "After the discount, the total comes to $#{self.total.to_int}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        @item_list
    end

    def void_last_transaction
        @price_item.pop
        @total = @price_item.sum.to_f
    
    end
end