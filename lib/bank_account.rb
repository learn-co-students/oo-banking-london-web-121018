class BankAccount
attr_reader :name
attr_accessor :balance , :status ,:deposit
  def initialize(name,balance=1000,status='open')
    @name = name
    @balance =balance
    @status =status
  end

  def deposit(deposit)
    @balance +=deposit
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
      if @status == "open" && @balance > 0
        return true
      else
        false
      end
  end
  def close_account
    @status = "closed"

  end
end
