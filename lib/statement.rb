require_relative 'moneyflow'
class Statement
  attr_accessor :account
  def initialize(name_of_class)
    @account = name_of_class.new
  end

  def print_out
    puts "date || credit || debit || balance"
    working_array.reverse.each do |event|
    puts "#{event[:date]} || #{event[:credit]} || #{event[:debit]} || #{event[:balance]}"
   end
  end

  def working_array
     @account.history
  end
end
