
require 'pry'


class BankAccount

    attr_reader :name
    attr_accessor :balance, :status, :all

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        if (self.balance > 0) && self.status == 'open'
            return true 
        else
            return false
        end
    end

    def close_account
        @status = 'closed'
    end

    def self.all
        @@all
    end
    


end


Bank_test1 = BankAccount.new("wendy")

Bank_test2 = BankAccount.new("George")
