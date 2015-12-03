class PhonemesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    phonemes = Phoneme.all.map{|p| "#{p.spelling}: #{p.phoneme_type.phoneme_type}" }
    render json: phonemes
  end
end
