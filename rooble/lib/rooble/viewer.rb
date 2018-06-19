#next steps: make a class for new transactions, changing the balance

module Balances
	def show_balance
		account_type = self.class.to_s.gsub(/[A-Z]/) {|letter| letter = " #{letter}".downcase}.sub(" ", "")
		puts "#{client_name}'s #{account_type} account has #{balance} cents"
	end
	def change_balance(amount)
		@balance = @balance + amount
		puts "#{client_name}'s #{account_type} account has #{balance} cents"
	end
end


#customer.savings.show_balance
#"Ben's saving account balance is $3000"