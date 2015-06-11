class WordSearchesController < ApplicationController
  skip_before_action :verify_authenticity_token
def create
  word = Word.get(params[:spelling])
  render json: word.to_json
end

end
