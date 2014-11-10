describe WordRepo do
  describe 'fetch, the domain-specific language you can specify rhymes with' do
    let(:words){ ['a','b','c'] }
    it 'returns all words in the passed-in collection when given a *' do
      expect(WordRepo.new(words).fetch('*')).to eq(words)
    end

    it 'has an implied initial wildcard' do

    end
  end
end
