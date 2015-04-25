class RhymeSearchesController < ApplicationController
def create
  word = WordRepo.new.fetch(params[:term])
  render json: {rhymes: word}
end

end
