describe WordRepo do
  describe 'fetch, the domain-specific language you can specify rhymes with' do
    let(:words){ [word1, word2, word3] }
    let(:word1){ double(:word, pronunciation: 'AH1 L')}
    let(:word2){ double(:word, pronunciation: 'EE1 L')}
    let(:word3){ double(:word, pronunciation: 'EE1 K')}

    it 'has an implied initial wildcard' do
      expect(WordRepo.new(words).fetch('l')).to eq([word1, word2])
    end

    it 'treats . as a group of consonants' do
      artist = double(:artist, pronunciation: 'AA1 R T AH0 S T')
      purchase = double(:purchase, pronunciation: 'P ER1 CH AH0 S')

      words = [artist, purchase]
      expect(WordRepo.new(words).fetch('AA1.AH0 S T')).to eq([artist])
    end
  end
end
