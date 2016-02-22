require 'jumpstart_auth'
class MicroBlogger
	attr_reader :client, :screen_names
	def initialize
		puts "initiallizing.."
		@client = JumpstartAuth.twitter
		@screen_names = ["FakeName1360"]
		@screen_names += @client.followers.collect{|follower| @client.user(follower).screen_name}
		puts @screen_names
	end
	def follower_list
		@screen_names += @client.followers.collect{|follower| @client.user(follower).screen_name}
	end
	#def spam_my_followers(message)
	#	5.times do 
	#		follower_list.each {|flor| dm(flor, message)}
	#	end
	#end
	def every_last_tweet
		p @client.class
		friends = client.friends.collect {|friend| client.user(friend)}
		puts friends[1].status.source
	end
	def tweet(message)
		client.update(message)
	end
	def dm(target, message)
		puts "Trying to send #{target} thie direct message"
		if @screen_names.include?target
			puts message 
			message = "d @#{target} #{message}"
			tweet(message)
		else
			puts "This man doesn't follow you"
		end
	end
	def run
		puts "welcome to the twitter spam program"
		command_handler
	end
	def command_handler
		command = ""
		while command != "q"
			p command
			printf "enter command: "
			input = get_input
			command = input[0]
			value = input[1..-1]
			check(command, value)
		end
	end
	def check(command, value)
		case command
			when 'q' then puts 'Goodbye!!'
			when 't' then tweet(value.join(" "))
			when 'dm' then dm(value[0], value[1..-1].join(" ")) #value[0] the name , value[1..-1] the message
			when 'spam' then spam_my_followers(value.join(" "))
			when 'every' then every_last_tweet
			else
				puts "sorry i don't know how to excute #{value}"
		end
	end
	def get_input
		input = gets.chomp.split(" ")
	end
end
blogger = MicroBlogger.new
#puts blogger.clinet
blogger.run