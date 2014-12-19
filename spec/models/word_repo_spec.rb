require 'spec_helper'
describe WordRepo do
  describe 'fetch (a DSL to specify rhymes with)' do
    let(:awl){ double(:word, pronunciation: 'AH1 L')}
    let(:eel){ double(:word, pronunciation: 'EE1 L')}
    let(:eek){ double(:word, pronunciation: 'EE1 K')}
    let(:leek){ double(:word, pronunciation: 'L EE1 K')}

    it 'has an implied initial wildcard' do
      words = [awl, eel, eek]
      expect(WordRepo.new(collection: words).fetch('l')).to eq([awl, eel])
    end

    it 'does not have an implied final wildcard' do
      words = [eel, leek]
      expect(WordRepo.new(collection: words).fetch('l')).to eq([eel])
    end

    it 'treats . as a group of consonants' do
      artist = double(:artist, pronunciation: 'AA1 R T AH0 S T')
      purchase = double(:purchase, pronunciation: 'P ER1 CH AH0 S')

      words = [artist, purchase]
      expect(WordRepo.new(collection: words).fetch('AA1.AH0 S T')).to eq([artist])
    end

    describe 'without a passed-in collection' do
      subject { WordRepo.new }
      it 'interfaces with ActiveRecord by default' do
        FactoryGirl.create(:word)

        expect(subject.fetch('D').first).to be_a Word
      end
    end
  end
end
