class PhonemeMatcher
  def initialize(options)
    @phonemes = options[:phonemes]
    @phoneme_types = options[:phoneme_types]
  end

  def near_match(phoneme_spelling)
    passed_in_phoneme_type = @phonemes.select{|p| p.spelling == phoneme_spelling}.first.phoneme_type
    @phonemes.select do |phoneme|
      phoneme.phoneme_type == passed_in_phoneme_type
    end.map(&:spelling)
  end
end
