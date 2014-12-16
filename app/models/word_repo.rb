class WordRepo
  def initialize(collection)
    @collection = collection
  end

  def fetch(expression)
    consonant_group = ' ([\D]*?) '
    expression = /#{expression.upcase.gsub('.', consonant_group)}/
    @collection.select do |word|
      word.pronunciation[expression]
    end
  end
end
