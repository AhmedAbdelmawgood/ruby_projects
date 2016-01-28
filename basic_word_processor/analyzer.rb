text = ''
line_count = 0
File.open("oliver.txt").each do |line|
	line_count +=1
	text << line
	end

charac_length = text.length
x = text.split("")
number_letter = text.gsub(/\s+/,'').length
words = text.scan(/\w+/)
words_count = words.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length
stop_words = %w{the a by on for of are with just but and to the my I has some in}
key_words = words.select{|x| !stop_words.include?x}
			#summarize to one-third of the text
sentences = text.gsub(/\s+/," ").strip.split(/\.|\?|\!/)
one_third = sentences.length / 3
sorted_sentences = sentences.sort_by{|x| x.length}
ideally_sentences = sorted_sentences.slice(one_third,one_third+1) #slice the array at the one_third to the (one_third+1),number, elements after it
puts ideally_sentences.length
summ = ideally_sentences.select {|x| x=~ /is|are/}
puts summ.join(". ")
puts "percent of keywords to all the text: #{(key_words.length.to_f*100/words_count).to_i}"
puts "sentence: #{sentence_count}"
puts "lines: #{line_count}"
puts "words: #{words_count}"
puts "paragraphs: #{paragraph_count}"
puts "letters: #{number_letter}"
puts "character:#{charac_length}"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{words_count / sentence_count} words per sentence (average)"
class WhatTheFuck
	def self.call
		puts "lol"
	end
end
