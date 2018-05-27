# attempting to pull a var from a block in a class, and use it in a mixin

module Eyesight
    def see
        if @eyenumber > 0
            puts "I see with these #{eyenumber} eyes, of course."
        else
            puts "I can't see without eyes... :("
        end
    end
    def poke
        if @eyenumber < 1
            puts "Poke more if you must, but there is no greater sadness to befall me..."
            @eyenumber = 0
        elsif @eyenumber == 1
            puts "Now I'm blind... and we're no longer friends."
            @eyenumber -= 1
        else
            @eyenumber -= 1
            puts "Hey! Now I only have #{eyenumber} eyes left!"
        end
    end
end

class Animal
    include Eyesight
    attr_reader :eyenumber
    def initialize(eyes, legs, teeth, ears)
        @eyes = eyes
        @teeth = teeth
        @ears = ears
        @legs = legs
        @eyenumber = eyes.length
    end
end

class Monster < Animal
end