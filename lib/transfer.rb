class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status ,:amount

  def initialize(sender,receiver,status = 'pending',amount)
      @sender = sender
      @receiver = receiver
      @status = status
      @amount = amount
  end

def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
end




def execute_transaction
  if @sender.balance < @amount
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
elsif @status!= "complete" && @sender.valid?
   @receiver.balance += @amount
   @sender.balance -= @amount
   @status = "complete"
  end
end

def reverse_transfer
if @status == "complete"

  @receiver.balance -= @amount
  @sender.balance += @amount

end

  @status = "reversed"

end







end
