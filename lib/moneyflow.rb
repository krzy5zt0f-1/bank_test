class Flow
  def initialize
    @balance = 0
    @history = []
  end
  def deposit(money_in)
    @balance += money_in
    @history << { date: Time.new.strftime("%d/%m/%Y"),
                  action: "credit", amount: '%.2f' % money_in, balance: @balance }
  end

  def withdraw(money_out)
    @balance -= money_out
    @history << { date: Time.new.strftime("%d/%m/%Y"),
                  action: "debit", amount: '%.2f' % money_out, balance: @balance }
  end

  def balance
    @balance
  end

  def history
    @history
  end
end
