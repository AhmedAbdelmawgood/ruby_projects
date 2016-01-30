root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/tec_tac_toc.rb"

puts "Welcome to tic tac toe"
mody = TecTacToc::Player.new({color: "X", name: "mody"})
ahmed = TecTacToc::Player.new({color: "O", name: "ahmed"})
players = [mody, ahmed]
TecTacToc::Game.new(players).play
