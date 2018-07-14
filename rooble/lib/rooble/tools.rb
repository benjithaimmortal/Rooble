#defines some functions for viewing and changing things

#restrict balance change if transaction limit is 0, ignore accounts with no limit
#fix TypeError: String can't be coerced into Integer at line 14

#[customer].savings.show_balance
#"Ben's saving account balance is 3000 cents"
Money::Bank::GoogleCurrency.ttl_in_seconds = 86400
Money.default_bank = Money::Bank::GoogleCurrency.new


module Viewer
	def show_balance
		account_type = self.class.to_s.gsub(/[A-Z]/) {|letter| letter = " #{letter}".downcase}.sub(" ", "")
		puts "#{client_name}'s #{account_type} account balance is #{balance.cents} cents."
	end
	def change_balance(amount)
		case @transaction_limit
		when 0
			raise TransactionLimitError.new("Transaction limit has been reached.")
		when Integer
			@transaction_limit -= 1
			@balance = @balance + Money.new(amount, "USD")
		else
			@balance = @balance + Money.new(amount, "USD")
		end
		self.show_balance
	end
end

module Converter	
	def convert_to(currency)
		
		
  end
end


