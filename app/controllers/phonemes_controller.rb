class PhonemesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    phonemes = Phoneme.all.map{|p| {spelling: p.spelling.to_s, type: p.phoneme_type.phoneme_type }}
    render json: phonemes
  end
end
