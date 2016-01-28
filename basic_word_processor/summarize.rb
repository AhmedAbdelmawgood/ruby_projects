text = %q{
	Ruby is a great programming language. It is object oriented
and has many groovy features. Some people don't like it, but that's
not our problem! It's easy to learn. It's great. To learn more about Ruby,
visit the official Ruby Web site today.
}
sentence = text.gsub(/\s+/," ").strip.split(/\.|\?|\!/)
sentence_sorted = sentence.sort_by {|x| x.length}
one_third = sentence_sorted.length / 3
ideal_sentences = sentence_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
puts ideal_sentences.join(". ")
