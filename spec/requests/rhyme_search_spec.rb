require 'rails_helper'

describe 'the rhyme endpoint', :type => :request do
  describe '/rhyme_search/<search_term>' do

    let(:word_repo){instance_double(WordRepo)}
     before do
       FactoryGirl.create(:word,pronunciation: 'A')
       expect(WordRepo).to receive(:new).and_return(word_repo)
     end
    it 'responds to a create with json' do
      json_headers = 'content-type: application/json'

      expect(word_repo).to receive(:fetch).with('magic.regex').and_return('some rhymes')
      post '/rhyme_searches', {'term' => 'magic.regex', 'content-type'=> 'application/json'}

      ap 'body: ' + response.body
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['rhymes']).to eq('some rhymes')
    end
  end
end
