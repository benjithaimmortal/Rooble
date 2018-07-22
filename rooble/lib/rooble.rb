module Rooble
    #exterior api 
    require 'money'
    require 'eu_central_bank'

    #path
    require_relative './rooble/tools.rb'
    require_relative './rooble/account.rb'
    require_relative './rooble/client.rb'

end

class NoSuchAccountTypeError < NoMethodError; end
class TransactionLimitError < RuntimeError; end