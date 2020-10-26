class Flow
  def initialize
    @balance = 0
    @history = []
  end
  def deposit(money_in)
    @balance += money_in
    @history << { date: Time.new.strftime("%d/%m/%Y"),
                  credit: '%.2f' % money_in, balance: balance }
  end

  def withdraw(money_out)
    @balance -= money_out
    @history << { date: Time.new.strftime("%d/%m/%Y"),
                  debit: '%.2f' % money_out, balance: balance }
  end

  def balance
    '%.2f' % @balance
  end

  def history
    @history
  end
end
