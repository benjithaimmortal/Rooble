#defines some functions for viewing and changing things

#restrict balance change if transaction limit is 0, ignore accounts with no limit
#fix TypeError: String can't be coerced into Integer at line 14

#customer.savings.show_balance
#"This savings account balance is 3000 cents"



module AccountManager
	def show_balance
		account_type = self.class.to_s.gsub(/[A-Z]/) {|letter| letter = " #{letter}".downcase}.sub(" ", "")
		puts "This #{account_type} account balance is #{balance} cents"
	end
	def change_balance(amount)
		case @transaction_limit
		when 0
			raise TransactionLimitError.new("Transaction limit has been reached.")
		when Integer
			@transaction_limit -= 1
			@balance = @balance + amount
		else
			@balance = @balance + amount
		end
		self.show_balance
	end
end