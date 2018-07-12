module Psychics
	def is_psychic?
		psychic.nil?
	end
end


class Characters
	def initialize(first_name, last_name, job, psychic)
		@first_name = first_name
		@last_name = last_name
		@job = job
		@psychic = psychic
		puts "Initializing #{self.class.to_s}"
	end
end

class Dirk < Characters
	def initialize(psychic = 1)
		super("Dirk", "Gently", "Detective")
		@first_name = first_name
		@last_name = last_name
		@job = job
		@psychic = psychic
		puts "Initializing #{self.class.to_s}"
	end
end

class Todd < Characters
	def initialize(psychic = nil)
		super("Todd", "Brontzman", "Assistant")
		@first_name = first_name
		@last_name = last_name
		@job = job
		@psychic = psychic
		puts "Initializing #{self.class.to_s}"
	end
end
	
class Bart < Characters
	def initialize(psychic = 1)
		super("Bart", "Curlish", "Assassin")
		@first_name = first_name
		@last_name = last_name
		@job = job
		@psychic = psychic
		puts "Initializing #{self.class.to_s}"
	end
end