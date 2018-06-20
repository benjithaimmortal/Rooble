#saves user demos
class User
    def initialize(client_number = nil, last_name = nil, first_name = nil, dob = nil, phone = nil, address_line_1 = nil, address_line_2 = nil)
        @client_number = client_number
        @last_name = last_name
        @first_name = first_name
        @dob = dob
        @phone = phone
        @address_line_1 = address_line_1
        @address_line_2 = address_line_2

        

        @client_name = last_name + ", " + first_name

        @user_db = {
            client_number: @client_number,
            client_name: @client_name,
            dob: @dob,
            phone: @phone,
            address_line_1: @address_line_1,
            address_line_2: @address_line_2
        }

        attr_accessor :user, :client_number, :client_name, :dob, :phone, :address_line_1, :address_line_2
    end
end