require_relative "tec_tac_toc/version"

module TecTacToc
end
require_relative "tec_tac_toc/core_extensions"
lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/tec_tac_toc/**/*.rb"].each { |file| require file }
