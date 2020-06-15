class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize (sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

    def execute_transaction
      if sender.valid? == false || sender.balance < self.amount
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      elsif sender.valid? == true && self.status != "complete"
      sender.balance = sender.balance -= amount
      receiver.balance = receiver.balance += amount
      self.status = "complete"
    end
    end

    def reverse_transfer
      if self.status == "complete"
      sender.balance = sender.balance += amount
      receiver.balance = receiver.balance -= amount
      self.status = "reversed"
    end
    end

end
