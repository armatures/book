require 'factory_girl'

FactoryGirl.define do
  factory :word do
    spelling 'WORD'
    pronunciation 'W ER1 D'
    syllables 1
  end
end
