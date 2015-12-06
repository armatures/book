class WordRepo
  def initialize(options=nil)
    @collection = options[:collection] if options
  end

  def fetch(expression)
    subbed_expression = replace_expression_wildcards expression
    regex = /#{subbed_expression}\z/

    collection.select do |word|
      regex=~ word.pronunciation
    end
  end

  private
    def replace_expression_wildcards(expression)
      subbed = expression.upcase.gsub('.', consonant_group)
      subbed = subbed.gsub('_S',phoneme_stop_match)
      puts subbed
      subbed
    end

    def phoneme_stop_match
      reg = ['B', 'D', 'G', 'K', 'P', 'T'].join('|')
      puts reg
      "[#{reg}]"
    end

    def consonant_group
      ' ([\D]*?) '#no numbers
    end

    def collection
      @collection || Word
    end
end
