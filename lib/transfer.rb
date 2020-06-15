require 'pry'
class Transfer
  # your code here

attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @status = 'pending'
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
    #binding.pry
    if self.status != 'complete'
        sender.balance = sender.balance - self.amount
        receiver.balance = receiver.balance + self.amount
        self.status = 'complete'
    end
    if sender.valid? == false
      reverse_transfer
      self.status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end

end

  def reverse_transfer
    if self.status == 'complete'
      receiver.balance = receiver.balance -= amount
      sender.balance = sender.balance += amount
      self.status = 'reversed'
   end
  end

end
