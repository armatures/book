class Sound
  attr_accessor :spelling

	def initialize(spelling)
		@spelling=spelling
	end

  def vowel?
  	!spelling.match(/\d/).nil?
  end

  def consonent?
  	!vowel?
  end

  def self.soundex_like_hash
    {'B'=> 1, 'P'=> 1, 'F'=> 1, 'V'=> 1,
     'CH'=> 2, 'S'=> 2, 'SH'=> 2, 'K'=> 2, 'G'=> 2, 'J'=> 2, 'Q'=> 2, 'X'=> 2, 'Z'=> 2,
     'D'=> 3, 'T'=> 3,
     'L'=> 4,
     'M'=> 5, 'N'=> 5,
     'R'=> 6 }
  end

  SOUNDEX_SOUNDS = []
  soundex_like_hash.map do |key,index|
    if SOUNDEX_SOUNDS[index].nil?
      SOUNDEX_SOUNDS[index] = [Sound.new(key)]
    else
      SOUNDEX_SOUNDS[index] << Sound.new(key)
    end
  end

  def soundex_single
    int_value = self.class.soundex_like_hash[spelling]
    self.class::SOUNDEX_SOUNDS[int_value]
  end
end
