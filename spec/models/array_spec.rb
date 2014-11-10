require 'spec_helper'
require 'array'
describe SoundArray do
  let(:one_sound){SoundArray.new [['P','B']]}
  let(:arr){SoundArray.new [['AE1'],['P','B']]}
  let(:bap){SoundArray.new [['P','B'],'AE1',['P','B']]}
  let(:two_by_two){SoundArray.new [['a','b'],['c','d']] }

	describe '#ordered_combine' do
    it 'returns the related consonants if there is only one sound in the word' do
      expect(one_sound.ordered_combine).to eq(one_sound)
    end

		it 'combines one start with two endings' do
      expect(arr.ordered_combine).to eq(SoundArray.new [['AE1','P'],['AE1','B']])
		end

		it '2x2 gives four options' do
      expect(two_by_two.ordered_combine).to eq(SoundArray.new [['a','c'],
                                                              ['a','d'],
                                                              ['b','c'],
                                                              ['b','d']])
		end

    # it 'combines four options from two starts and two endings' do
      # expect(bap.ordered_combine).to eq(SoundArray.new([['P','AE1','P'],
                                         # ['P','AE1','B'],
                                         # ['B','AE1','P'],
                                         # ['B','AE1','B'],
                                         # ]))
    # end
	 end

  describe '#one_step' do
    subject { SoundArray.new([]) }
    it 'returns an array' do
      expect(subject.one_step('a',['b','c'])).to eq([['a','b'],['a','c']])
    end
  end
end
