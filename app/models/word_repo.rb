class WordRepo
  def initialize(options=nil)
    @collection = options[:collection] if options
  end

  def fetch(expression)
    subbed_expression = expression.upcase.gsub('.', consonant_group)
    regex = /#{subbed_expression}\z/

    collection.select do |word|
      word.pronunciation[regex]
    end
  end

  private
    def consonant_group
      ' ([\D]*?) '
    end

    def collection
      @collection || Word
    end
end
