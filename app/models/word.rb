class Word < ActiveRecord::Base

	(1..9).each do |i|
			method_name="last_#{i}"
			define_method method_name.to_s do
			pronunciation.split[-i..-1]
		end
	end

  def sounds
  	pronunciation.split.map do |s|
  		Sound.new(s)
  	end
  end

  def soundex
  	soundex_code=[]
  	sounds.each do |sound|

  		soundex_code << soundex_hash[sound.spelling.first.to_s] unless sound.vowel?
  	end
    soundex_code
  end

  #returns a RhymeSpace
  def soundex_similar(syllable)
    syllable.map do |sound_spelled|
        sound=Sound.new(sound_spelled)
        if(sound.vowel?)
          sound
        else
          sound.soundex_single #returns near-rhymes for a single sound
        end
    end
  end

  def syllables
    syllable_index = -1
    sounds.inject([[]]) do |coll, el|
      if el.vowel?
        syllable_index+=1
        coll[syllable_index] = []
      end
      coll[syllable_index] << el.spelling if syllable_index >= 0
      coll
    end
  end

  def rhymes(args={})
    last_syllable = syllables.last
    if args == :fuzzy_consonants
      rhyme_space = soundex_similar(last_syllable)
      binding.pry
      all_spellings_flat = rhyme_space.ordered_combine
      Word.pronunciation_ends_with_any_of(all_spellings_flat)
    else
      Word.pronunciation_ends_with(last_syllable.join(' '))
    end
  end

  def self.get(spelling)
    Word.find_by_spelling(spelling.upcase)
  end

  def self.ends_with(spelling)
    Word.where("spelling like '%#{spelling.upcase}'")
  end

def self.pronunciation_ends_with_any_of(spellings)
  query = spellings.inject([]) do |collector, spelling|
    collector << "pronunciation like '%#{spelling.upcase}'"
  end.join(" OR ")
  Word.where(query)
end

def self.pronunciation_ends_with(pronunciation)
  Word.where("pronunciation like '%#{pronunciation.upcase}'")
end

#scope :created_before, ->(time) { where("created_at < ?", time) }

# Word.where("pronunciation ~* 'OW1 T$'").limit(100)

	# def method_missing(name, *args)
	#   super if !name.match /^last_\d$/

	#   num_match = name.to_s.match /\d/
 #    num = num_match[0].to_i
 #    pronunciation.split[-num..-1]
	# end
end
