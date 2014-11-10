require 'word_parser'
class CmudictParser
	def self.parse(file_path)
	words=[]
	# file_path = "#{File.dirname(__FILE__)}/cmudict/testfile" unless file_path
	file = File.new(file_path)
		file.each_line do |line|
			match = line.match(/^\S*/)
			if !match.nil? && match[0] !~ /^;;;/
				word,pronunciation,syllable_count = WordParser.parse_line match
				words << {spelling: word, pronunciation: pronunciation, syllables: syllable_count}
			end
		end
	words
	end
end