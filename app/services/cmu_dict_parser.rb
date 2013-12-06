class CmuDictParser
	def self.parse (file_path)
	file = File.new(file_path)
		file.each_line do |line|
			match = line.match(/^\S*/)
			if !match.nil? && match[0] !~ /^;;;/
				word,pronunciation,syllables = WordParser.parse_line match
				word_obj = Word.new(spelling: word, pronunciation: pronunciation, syllables: syllables)
				word_obj.save!
				puts word_obj.inspect
			end
		end
	end
end