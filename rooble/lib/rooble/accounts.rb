#the basic information that an account has
class Account
	attr_reader	:account_number, :balance, :transaction_limit

	def initialize(args)
		@account_number			= args[:account_number]
		@balance 						= args.fetch(:balance, 0)
		@transaction_limit 	= args.fetch(:transaction_limit, nil)
	end
end

class Checking < Account
	def initialize(args)
		super(args)
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
	end
end
