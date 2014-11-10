describe WordRepo do
  describe 'fetch, the domain-specific language you can specify rhymes with' do
    let(:words){ [word1, word2, word3] }
    let(:word1){ double(:word, pronunciation: 'AH1 L')}
    let(:word2){ double(:word, pronunciation: 'EE1 L')}
    let(:word3){ double(:word, pronunciation: 'EE1 K')}
    it 'returns all words in the passed-in collection when given a *' do
      expect(WordRepo.new(words).fetch('*')).to eq(words)
    end

    it 'has an implied initial wildcard' do
      expect(WordRepo.new(words).fetch('l')).to eq([word1, word2])
    end
  end
end
