class Transfer

attr_accessor :amount, :sender, :receiver, :status


  def initialize (sender, reciever, amount)
    @sender = sender
    @receiver = reciever
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && sender.balance > amount
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end


end
