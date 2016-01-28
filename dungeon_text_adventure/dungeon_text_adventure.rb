#this is a dungeon text adventure
class Dungeon
  attr_accessor :player
  def initialize(name)
    @player = Player.new(name)
    @rooms = []
  end
  def add_room(refer,name,description,connection)
    @rooms << Room.new(refer,name,description,connection)
  end
  def start(location) #location is the room reference
    @player.location = location
    show_current_description
  end
  def show_current_description
    puts @player.name
    puts room_in_dungeon(@player.location).full_description   #search for the room
  end
  def room_in_dungeon(reference)
    @rooms.detect {|room| room.reference == reference}
  end
  def find_room_in_direction(direction) #east,west,north ,or south
    room_in_dungeon(@player.location).connection[direction]
  end
  def go(direction)
    puts "You go #{direction.to_s}"
    @player.location = find_room_in_direction(direction)
    show_current_description
  end
  class Room
    attr_accessor :reference,:name,:description,:connection
    def initialize(reference,name,description,connection)
      @reference = reference
      @name = name
      @description = description
      @connection = connection
    end
    def full_description
      "#{@name} \nyou are in #{@description}" #need some playing
    end
  end

  Player = Struct.new(:name,:location)
end
stage_one = Dungeon.new("Ahmed Samir")
stage_one.add_room(:largecave,"Large Cave","Very dangerous and large area",{east: :smallcave})
stage_one.add_room(:smallcave,"Small Cave","very scarry area",{west: :largecave})
stage_one.start(:largecave)
stage_one.go(:east)
