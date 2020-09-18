class Transfer
  #
  attr_accessor :sender, :receiver, :status, :amount
  @@all = []
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << self

  end

  def valid?
    if sender.valid? && receiver.valid?
       true
    else 
       false
    end 
  end 

  def execute_transaction
     if self.valid? && self.status == "pending" && sender.balance > self.amount 
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    
     else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
     end 
  end 

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount 
      self.status = "reversed"
    end 

  end 


end
