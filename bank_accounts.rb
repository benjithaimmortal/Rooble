module TransactionLimit
	def transaction_limit?
		if transaction_limit.nil?
			print "@[transaction_limit] transactions remaining."
		else
			print "No transaction limit."
		end
		puts "Initializing #{self.class.to_s}"
	end
end

module Viewer
	def view_accounts
		print "@{name} has account number @{auth}. Do you want to know the balance? Y/N"
	end
end

class Account
	def initialize(name, balance, auth, transaction_limit)
		@name = client_name
		@balance = account_balance
		@auth = account_number
		@transaction_limit = transaction_limit
		print "Initializing #{self.class.to_s}"
	end
end

class Checking < Account
	def initialize(name, balance, auth, transaction_limit = nil)
		super(name, balance, auth)
		print "Initializing #{self.class.to_s}"
	end
end

class Savings < Account
	def initialize(name, balance, auth, transaction_limit = 3)
		super(name, balance, auth)
		print "Initializing #{self.class.to_s}"
	end
end

class MoneyMarket < Account
	def initialize(name, balance, auth, transaction_limit = nil)
		super(name, balance, auth)
		print "Initializing #{self.class.to_s}"
	end
end
