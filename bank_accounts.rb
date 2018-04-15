# bank_accounts


#determines transaction limits
module TransactionLimit
	def display_transaction_limit
		if transaction_limit.nil?
			puts "No transaction limit."
		else
			puts "#{transaction_limit} transactions remaining."
		end
	end
end

module Viewer
	def view_accounts
		puts "@{name} has account number @{auth}. Do you want to know the balance? Y/N"
	end
end

class Account
	include TransactionLimit
	def initialize(client_name, balance, account_number, transaction_limit)
		@client_name = client_name
		@balance = balance
		@account_number = account_number
		@transaction_limit = transaction_limit
		puts "Initializing #{self.class.to_s}"
	end
	attr_reader	:client_name, :balance, :account_number #, :transaction_limit
	def transaction_limit
		puts "Retrieving limit: #{@transaction_limit}"
		@transaction_limit
	end
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


# account = Checking.new ("")

