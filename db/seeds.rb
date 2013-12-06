# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	# def self.syllable_count (word)
	# 	count=0
	# 	word.each_char do |c|
	# 		if c.match(/\d/)
	# 			puts "#{c} in #{word}"
	# 			count+=1 
	# 		end
	# 	end
	# 	count
	# end

	# def self.parse_line(match)
	# 	word = match[0]
	# 	pronunciation = match.post_match.strip
	# 	syllables = syllable_count pronunciation
	# 	[word,pronunciation,syllables]
	# end

	# def self.parse
	# file = File.new('/Users/charliebevis/workspace/cmudict/')
	# 	file.each_line do |line|
	# 		match = line.match(/^\S*/)
	# 		if !match.nil? && match[0] !~ /^;;;/
	# 			word,pronunciation,syllables = parse_line match
	# 			Word.create( word: word,pronunciation: pronunciation,syllables: syllables)
	# 			puts "#{word} added to the table"
	# 		end
	# 	end
	# end

	# parse
