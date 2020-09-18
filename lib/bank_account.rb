class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(money)
        @balance += money
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end 

    def valid?
        if status == "open" && balance > 0 
            return true
        else 
            return false
        end 
    end 

    def close_account
        self.status = "closed"
    end 
     

end
