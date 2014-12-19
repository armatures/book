require 'spec_helper'
describe PhonemeMatcher do
  describe 'near_match' do
    it 'returns a list of phonemes with the same phoneme_type' do
      fricative = PhonemeType.new(phoneme_type: 'fricative')
      stop = PhonemeType.new(phoneme_type: 'stop')
      phoneme_types = [fricative, stop]

      s = Phoneme.find_or_create_by spelling: 'S', phoneme_type: fricative
      z = Phoneme.find_or_create_by spelling: 'Z', phoneme_type: fricative
      t = Phoneme.find_or_create_by spelling: 'T', phoneme_type: stop
      phonemes = [s, z, t]

      phoneme_matcher = PhonemeMatcher.new(phonemes: phonemes, phoneme_types: phoneme_types)
      expect(phoneme_matcher.near_match('S')).to eq(['S', 'Z'])
    end
  end
end
