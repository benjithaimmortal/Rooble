#defines some functions for viewing and changing things

#customer.savings.show_balance
#"Ben's saving account balance is 3000 cents"

module Balances
	def show_balance
		account_type = self.class.to_s.gsub(/[A-Z]/) {|letter| letter = " #{letter}".downcase}.sub(" ", "")
		puts "#{client_name}'s #{account_type} account balance is #{balance} cents"
	end
	def change_balance(amount)
		@balance = @balance + amount
		puts amount + " has been adjusted in the account. " + client_name +
			"'s #{account_type} account balance is #{balance} cents"
	end
end