module Rooble
    require_relative './rooble/converter.rb'
    require_relative './rooble/account_manager.rb'
    require_relative './rooble/accounts.rb'
    require_relative './rooble/client.rb'
end

#errors
class NoSuchAccountTypeError < NoMethodError; end
class TransactionLimitError < RuntimeError; end