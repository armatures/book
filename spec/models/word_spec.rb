require 'test_helper'
describe Word do 
	let(:word){Word.new(spelling: "LOPATA", pronunciation: "L OW0 P AA1 T AH0", syllables: 3)}

	describe '#last_4' do
		it 'grabs the last 4 sounds from a word' do
  		expected_array = ["P", "AA1", "T", "AH0"]
  		expect(word.last_4).to eq expected_array
		end
	end

	describe '#last_3' do
		it 'grabs the last 3 sounds from a word' do
  		expected_array = ["AA1", "T", "AH0"]
  		expect(word.last_3).to eq expected_array
		end
	end

	describe 'syllables_spelled' do
		it 'returns syllables with a #vowel? method' do
			expect(word.sounds[0].vowel?).to be_false
			expect(word.sounds[1].vowel?).to be_true
		end
		
	end
end
