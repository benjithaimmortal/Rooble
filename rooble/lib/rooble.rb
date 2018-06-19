puts 'Rooble Loading'

module Rooble
    require_relative './rooble/viewer.rb'
    require_relative './rooble/accounts.rb'
    require_relative './rooble/new_client.rb'
end

class NoSuchAccountTypeError < NoMethodError; end