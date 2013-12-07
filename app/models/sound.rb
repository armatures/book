class Sound
  attr_accessor :spelling
  
	def initialize(spelling)
		@spelling=spelling
	end

  def vowel?
  	!spelling.match(/\d/).nil?
  end
end
