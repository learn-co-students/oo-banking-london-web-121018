require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount
  attr_reader :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == "complete"
      return
    end

    @receiver.deposit(amount)
    @sender.deposit(-amount)
    @status = "complete"

    if !valid?
      @receiver.deposit(-amount)
      @sender.deposit(amount)
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-amount)
      @sender.deposit(amount)
      @status = "reversed"
    end
  end
  #binding.pry
end
