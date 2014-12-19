class WordRepo
  def initialize(options=nil)
    @collection = options[:collection] if options
  end

  def fetch(expression)
    consonant_group = ' ([\D]*?) '
    subbed_expression = expression.upcase.gsub('.', consonant_group)
    regex = /#{subbed_expression}\z/
    collection.select do |word|
      word.pronunciation[regex]
    end
  end

  def collection
    @collection || Word
  end
end
