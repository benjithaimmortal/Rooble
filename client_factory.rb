require_relative 'bank_accounts'

class Client
	include AccountFunctions
	def initialize(last_name, first_name, phone_number, address_line_1, account_type, account_number = nil)
		@last_name = last_name
		@first_name = first_name
		@phone_number = phone_number
		@address_line_1 = address_line_1
		@account_type = account_type
		@account_number = account_number
		@client_name = "#{@last_name}, #{@first_name}"
	end
	def make_client
		if account_number.nil?
			@account_number = rand(10000..99999)
			puts "New account number created: #{account_number}"
		else puts "Account number: #{account_number}"
		end
		@account_number = "#{account_type}".new(@client_name, @balance, @account_number)
	end
end