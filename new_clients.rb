class Client
	def initialize (client_name, investment_dollars, balance_hash, account_number=nil)
		@client_name = client_name
		@account_number = account_number = rand(10000..99999) if @account_number.nil?
		@investment_dollars = investment_dollars
		@balance_hash = balance_hash

		balance_hash.each do |k,v|
			@balance_cents = v * @investment_dollars
			@account_type = k = k.capitalize
			puts "Hi it's #{balance_cents} money from the block, but I couldn't make a #{k} class :("
#			account = k.new
		end
	end

#	def savings
#		@savings = Savings.new(@client_name, @account_number, @balance_cents)
#	end
#	def checking
#		@checking = Checking.new(@client_name, @account_number, @balance_cents)
#	end
#	def money_market
#		@money_market = MoneyMarket.new(@client_name, @account_number, @balance_cents)
#	end

	def show_balance
		puts "#{client_name}'s #{account_type} account balance is #{balance_cents}"
	end
end

class Account
	def initialize(client_name, account_number, balance_cents, transaction_limit)
		@client_name = client_name
		@balance_cents = balance_cents
		@account_number = account_number
		@transaction_limit = transaction_limit
		puts "Initializing #{self.class.to_s}"
	end
	attr_reader	:client_name, :balance_cents, :account_number, :transaction_limit
end

class Checking < Account
	def initialize(client_name, account_number, balance_cents, transaction_limit = nil)
		super(client_name, account_number, balance_cents, transaction_limit)
		puts "Initializing #{self.class.to_s}"
	end
end

class Savings < Account
	def initialize(client_name, account_number, balance_cents, transaction_limit = 3)
		super(client_name, account_number, balance_cents, transaction_limit)
		puts "Initializing #{self.class.to_s}"
	end
end

class MoneyMarket < Account
	def initialize(client_name, account_number, balance_cents, transaction_limit = nil)
		super(client_name, account_number, balance_cents, transaction_limit)
		puts "Initializing #{self.class.to_s}"
	end
end

#customer = Client.new("Ben", 10_000, {savings: 30, checking: 60, money_market: 10})
#customer.savings.show_balance
#"Ben's saving account balance is $3000"