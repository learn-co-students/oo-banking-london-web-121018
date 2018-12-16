
require 'pry'

class Transfer

  attr_accessor :sender,  :receiver, :amount, :status, :bank_account

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount  = amount
  end

  def valid?
    if (@sender.valid? && @receiver.valid?) == true
      return true
    end
  end

  def execute_transaction
    if (@status != "complete")
      if @amount > @sender.balance
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."

      else
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
  
      
end
