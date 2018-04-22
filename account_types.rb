class Account
	include AccountFunctions
	def initialize(client_name, balance, account_number, transaction_limit)
		@client_name = client_name
		@balance = balance
		@account_number = account_number
		@transaction_limit = transaction_limit
		puts "Initializing #{self.class.to_s}"
	end
	attr_reader	:client_name, :balance, :account_number, :transaction_limit
end

class Checking < Account
	def initialize(client_name, balance, account_number, transaction_limit = nil)
		super(client_name, balance, account_number, transaction_limit)
		puts "Initializing #{self.class.to_s}"
	end
end

class Savings < Account
	def initialize(client_name, balance, account_number, transaction_limit = 3)
		super(client_name, balance, account_number, transaction_limit)
		puts "Initializing #{self.class.to_s}"
	end
end

class MoneyMarket < Account
	def initialize(client_name, balance, account_number, transaction_limit = nil)
		super(client_name, balance, account_number, transaction_limit)
		puts "Initializing #{self.class.to_s}"
	end
end