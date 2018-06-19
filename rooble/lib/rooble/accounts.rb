#the basic information that an account has
class Account
	include Balances
	def initialize(client_name, client_number, balance, transaction_limit)
		@client_name = client_name
		@balance = balance
		@client_number = client_number
		@transaction_limit = transaction_limit
		
		account_type = self.class.to_s.gsub(/[A-Z]/) {|letter| letter = " #{letter}".downcase}.sub(" ", "")
		puts "Initializing " + account_type
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
