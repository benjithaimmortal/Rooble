#defines some functions for viewing and changing things

#restrict balance change if transaction limit is 0, ignore accounts with no limit

#customer.savings.show_balance
#"This savings account balance is 3000 cents"

module AccountManager
	attr_accessor :account_number, :balance
	def register(args)
		args[:investment_ratio].each do |k, v|
			@balance = (v * args[:investment_cents]) / 100
			new_account(k)
			
			show_balance
		end
	end

	def new_account(type)
		account_number = (rand(1000..9999))
		begin
			type.to_s.camelize.new({balance: balance, account_number: account_number})
		rescue NoMethodError => nme
			puts "Caught #{nme.to_s}"
			raise NoSuchAccountTypeError.new("Account type #{k.to_s} is not valid. " +
									"Valid account types: savings, checking, money_market")
		end
		
		# case type
		# when :checking
		# 	Checking.new({balance: balance, account_number: account_number})
		# when :savings
		# 	Savings.new({balance: balance, account_number: account_number})
		# when :money_market
		# 	MoneyMarket.new({balance: balance, account_number: account_number})
		# else
		# 	raise AccountTypeError.new("Account type is not valid. " +
		# 											"Valid account types: savings, checking, money_market")
		# end
	end

#	self.send(k.to_sym.new_account({balance: balance}))
# register({investment_cents: 100, investment_ratio: {checking: 100}})

	def show_balance
		account_type = self.class.to_s.gsub(/[A-Z]/) {|letter| letter = " #{letter}".downcase}.sub(" ", "")
		puts "This #{account_type} account balance is #{@balance} cents"
	end

	def change_balance(amount)
		raise TransactionLimitError.new("Transaction limit has been reached.") if @transaction_limit.eql?(0)
		@transaction_limit -= 1 if !@transaction_limit.nil?
		@balance += amount
		self.show_balance
	end
end