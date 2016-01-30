module TecTacToc
  class Player
    def self.a7a
      puts "a7a"
    end
    attr_reader :color, :name
    def initialize(input)
      @color = input.fetch(:color)
      @name = input.fetch(:name)
    end
  end
end
