require 'spec_helper'
describe Word do
	let(:word){Word.new(spelling: "LOPATA", pronunciation: "L OW0 P AA1 T AH0", syllables: 3)}
	let(:haskell){Word.new(spelling: "HASKELL", pronunciation: "HH AE1 S K AH0 L", syllables: 2)}
	let(:shell){Word.new(spelling: "SHELL", pronunciation: "SH EH1 L", syllables: 1)}
	let(:well){Word.create(spelling: "WELL", pronunciation: "W EH1 L", syllables: 1)}

	let(:cram){Word.new(spelling: "CRAM", pronunciation: "K R AE1 M", syllables: 1)}
	let(:tan){Word.create(spelling: "TAN", pronunciation: "T AE1 N", syllables: 1)}

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

	describe '#sounds' do
		it 'returns sounds (chunks of a pronunciation) with a #vowel? method' do
			expect(word.sounds[0].vowel?).to be_false
			expect(word.sounds[1].vowel?).to be_true
		end
	end

	describe '#syllables' do
		it 'splits the pronunciation into chunks that each end with
										a consonent and each have at least one vowel' do
			expect(word.syllables).to eq([["OW0", "P"], ["AA1", "T"], ["AH0"]])
			#drop the first letter, cause it doesn't matter for rhymes
						#This maybe should be an array of Syllable objects though
			#and each syllable could have an array of sounds
			# and exclude the first sound if it's a consonent for the sake of finding rhymes.
		end
	end

	describe '#rhymes' do
		it "returns one-syllable words that match the word's syllable exactly" do
			expect(shell.rhymes).to include well
		end

#		it 'returns near-rhymes when passed a :fuzzy_consonants argument' do
#			expect(cram.rhymes(:fuzzy_consonants)).to include tan
#		end
	end
end
