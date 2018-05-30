#next steps: create a percentage checker, which makes sure all money is vested
#next steps: create an algorithm which checks decimals and moves them to the appropriate fund
#next steps: make a class for new transactions, changing the balance


#fix bug: if no Balances show_balance mixin, throws NoSuchAccountType error

#figure out: where is the @account_type variable and why can't I use it in the mixin??
	#answer: the variable was trying to pull itself from the Client class instead of the Account class
#figure out: how to command/display the balance from a class that is created from a factory

module Balances	
	def show_balance
		account_type = self.class.to_s.gsub(/([A-Z])/) {|letter| letter = " #{letter}".downcase }.sub(" ", "")
		puts "#{client_name}'s #{account_type} account now has #{balance} cents"
	end
end


#name a new error
class NoSuchAccountTypeError < NoMethodError; end

#a client template which produces a client number and appropriate accounts based on % of investment
class Client
	include Balances

	attr_reader :client_name, :balances

	def initialize(client_name, investment_cents, balances, client_number = nil)
		@client_name = client_name
		@client_number = client_number.nil? ? rand(10000..99999) : client_number
		@investment_cents = investment_cents
		@balances = balances
		@account_type = nil

		balances.each do |k, v|
			@balance = (v * @investment_cents) / 100
			begin
				self.send("create_#{k.to_s}".to_sym)
			rescue NoMethodError => nme
				puts "Caught #{nme.to_s}"
				raise NoSuchAccountTypeError.new("Account type #{k.to_s} is not valid. " +
																						"Valid account types: savings, checking, money_market")
			end
		end
	end

	def create_savings
		@savings = Savings.new(@client_name, @client_number, @balance)
		@savings.show_balance
	end
	def create_checking
		@checking = Checking.new(@client_name, @client_number, @balance)
		@checking.show_balance
	end
	def create_money_market
		@money_market = MoneyMarket.new(@client_name, @client_number, @balance)
		@money_market.show_balance
	end
end


#the basic information that an account requires
class Account
	include Balances
	def initialize(client_name, client_number, balance, transaction_limit)
		@client_name = client_name
		@balance = balance
		@client_number = client_number
		@transaction_limit = transaction_limit
		puts "Initializing #{self.class.to_s}"
	end
	attr_reader	:client_name, :balance, :client_number, :transaction_limit
end

class Checking < Account
	def initialize(client_name, client_number, balance, transaction_limit = nil)
		super(client_name, client_number, balance, transaction_limit)
	end
end

class Savings < Account
	def initialize(client_name, client_number, balance, transaction_limit = 3)
		super(client_name, client_number, balance, transaction_limit)
	end
end

class MoneyMarket < Account
	def initialize(client_name, client_number, balance, transaction_limit = nil)
		super(client_name, client_number, balance, transaction_limit)
	end
end

#customer = Client.new("Ben", 10_000, {savings: 30, checking: 60, money_market: 10})
#customer.savings.show_balance
#"Ben's saving account balance is $3000"