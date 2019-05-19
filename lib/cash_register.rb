require 'pry'

class CashRegister
  attr_accessor :total, :discount, :cart, :items, :transactions

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @cart = []
    @items = []
    @transactions = []
  end

  def add_item(item, price, quantity = 1)
    @cart << {item: item, price: price, quantity: quantity}
    quantity.times { @items << item }
    @transactions << price
    @total += price * quantity
  end

  def apply_discount
    if @discount
      @total *= 0.8
      "After the discount, the total comes to $#{@total.to_i}."
    else "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @transactions.pop
  end
end
