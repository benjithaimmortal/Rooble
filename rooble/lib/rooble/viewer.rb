#defines some functions for viewing and changing things

#restrict balance change if transaction limit is 0, ignore accounts with no limit
#fix TypeError: String can't be coerced into Integer at line 14

#customer.savings.show_balance
#"Ben's saving account balance is 3000 cents"



module Viewer
	def show_balance
		account_type = self.class.to_s.gsub(/[A-Z]/) {|letter| letter = " #{letter}".downcase}.sub(" ", "")
		puts "#{client_name}'s #{account_type} account balance is #{balance} cents"
	end
	def change_balance(amount)
		case @transaction_limit 
		when 0
			raise "Transaction limit reached."
		when Integer
			@transaction_limit -= 1
			@balance = @balance + amount
		else
			@balance = @balance + amount
		end
		account_type = self.class.to_s.gsub(/[A-Z]/) {|letter| letter = " #{letter}".downcase}.sub(" ", "")
		puts @client_name + "'s #{account_type} account balance is #{balance} cents"
	end
end