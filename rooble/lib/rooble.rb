module Rooble
    require_relative './rooble/viewer.rb'
    require_relative './rooble/accounts.rb'
    require_relative './rooble/client.rb'
    require_relative './rooble/users.rb'
end

puts 'Rooble has loaded. Welcome!'

class NoSuchAccountTypeError < NoMethodError; end