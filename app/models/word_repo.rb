class WordRepo
  def initialize(options=nil)
    @collection = options[:collection] if options
  end

  def fetch(expression)
    consonant_group = ' ([\D]*?) '
    expression = /#{expression.upcase.gsub('.', consonant_group)}/
    collection.select do |word|
      word.pronunciation[expression]
    end
  end

  def collection
    @collection || Word
  end
end
