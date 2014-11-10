class WordRepo
  def initialize(collection)
    @collection = collection
  end

  def fetch(expression)
    expression = '.*' + expression.gsub('*','.*')
    @collection.select{|word| word.pronunciation.downcase.match(expression)}
  end
end
