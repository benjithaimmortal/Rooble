#the basic information that an account has
class Account
	include AccountManager, Converter

	attr_reader	:client_number, :balance, :transaction_limit

	def initialize(args)
		@client_number 			= args[:client_number]
		@balance 						= args[:balance]
		@transaction_limit 	= args[:transaction_limit]
		@account_type 			= self.class.to_s.gsub(/[A-Z]/) {|letter| letter = " #{letter}".downcase}.sub(" ", "")
	end
end

class Checking < Account
	def initialize(args)
		super(args)
		@transaction_limit = nil
	end
end

class Savings < Account
	def initialize(args)
		super(args)
		@transaction_limit = 3
	end
end

class MoneyMarket < Account
	def initialize(args)
		super(args)
		@transaction_limit = nil
	end
end
