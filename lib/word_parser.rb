class WordParser
	def self.syllable_count (pronunciation)
		count=0
		pronunciation.each_char do |c|
			if c.match(/\d/)
				count+=1 
			end
		end
		return count
	end

	def self.parse_line(match)
		word = match[0]
		pronunciation = match.post_match.strip
		syllables = syllable_count pronunciation
		[word,pronunciation,syllables]
	end
end