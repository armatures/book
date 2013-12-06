class Word < ActiveRecord::Base

	(1..9).each do |i|
			method_name="last_#{i}"
			define_method method_name.to_s do
			pronunciation.split[-i..-1]
		end
	end

  def syllables_spelled
  	syllables = []
  	pronunciation.split.each do |s|
  		syllables << Syllable.new(s)
  	end
  	syllables
  end


# Word.where("pronunciation ~* 'OW1 T$'").limit(100)

	# def method_missing(name, *args)
	#   super if !name.match /^last_\d$/

	#   num_match = name.to_s.match /\d/
 #    num = num_match[0].to_i
 #    pronunciation.split[-num..-1]
	# end
end
