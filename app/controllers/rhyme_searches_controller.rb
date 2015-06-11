class RhymeSearchesController < ApplicationController
  skip_before_action :verify_authenticity_token
def create
  word = WordRepo.new.fetch(params[:term])
  render json: {rhymes: word}
end

end
