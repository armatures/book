class WordRepo
  def initialize(options)
    @collection = options[:collection]
  end

  def fetch(expression)
    consonant_group = ' ([\D]*?) '
    expression = /#{expression.upcase.gsub('.', consonant_group)}/
    @collection.select do |word|
      word.pronunciation[expression]
    end
  end
end
