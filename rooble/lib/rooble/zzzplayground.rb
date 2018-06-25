
module GoldenSlumbers
    def grow
        puts @height
        @height += 5
        puts @height
    end
end

class Lumberjacks
    include GoldenSlumbers
    def initialize(tool, age, height)
        @tool = tool
        @age = age
        @height = height
    end

    attr_reader :tool, :age, :height
end

lumb = Lumberjacks.new("Axe", 33, 158)
lumb.grow