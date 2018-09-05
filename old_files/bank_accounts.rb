require_relative 'client_factory'

# When debugging... this method can help you figure out what's going on/wrong inside the class.
#	def transaction_limit
#		puts "Retrieving limit: #{@transaction_limit}"
#		@transaction_limit
#	end


#determines transaction limits
module AccountFunctions
	def display_transaction_limit
		if transaction_limit.nil?
			puts "No transaction limit."
		else
			puts "#{transaction_limit} transactions remaining."
		end
	end
	def check_for_clients
		if @account_number.nil? || @client_name.nil?
			Client.make_client
		else
			"This client might be on file: as #{@client_name}."
		end
	end
end

	

=begin
	def make_new_client
		puts 'There is no client on file. Make a new one: /nLast name:'
		$stdin.gets = @last_name
		puts "First name:"
		$stdin.gets = @first_name
		puts "Phone number:"
		$stdin.gets = @phone_number

		account = @account_type.new (@client_name, @balance, @account_number, @transaction_limit)
	end
=end

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