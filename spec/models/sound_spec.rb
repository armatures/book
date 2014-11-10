require 'spec_helper'

describe Sound do
	let(:ah){Sound.new('AH0')}
	let(:k){Sound.new('K')}

	describe '#vowel?' do
		it 'returns true for a vowel' do
			expect(ah.vowel?).to be(true)
		end
		it 'returns false for a consonant' do
			expect(k.vowel?).to be(false)
		end
	end

  describe 'soundex_single' do
    it 'returns an array of Sounds' do
      expect(k.soundex_single.first.class).to eq(Sound)
    end
  end
end
