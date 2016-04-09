class Score

  LETTER_SCORES = {
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2 => ['D', 'G'],
    3 => ['B', 'C', 'M', 'P'],
    4 => ['F', 'H', 'V', 'W', 'Y'],
    5 => ['K'],
    8 => ['J', 'X'],
    10 => ['Q', 'Z']
  }

  def self.not_a_word?(input_string)
    # if string contains punctuation or a number, it will not be nil
    return false if /[\W\d]/.match(input_string).nil?
    true
  end

  def self.score(word)
    # check if word is actually a word (not containing punctuation or numbers)
    return "that's not a word!" if self.not_a_word?(word)

    score_array = self.letter_score(word)
    word_score = score_array.reduce(0) do |sum, set|
      sum + set[1]
    end
      
    word_score += 50 if word.length == 7

    word_score
  end

  def self.letter_score(word)
    letter_scores = []

    word.upcase!
    letter_array = word.split(//)

    letter_array.each do |letter|
      match = LETTER_SCORES.find do |key, value, a|
        value.include? letter
      end

      letter_scores << match.first
    end

    letter_array.zip(letter_scores)
  end

  def self.score_many(list_of_words)
    # remove any commas that may be separating words
    # replace with a space in case there's no space after the commas
    list_of_words.gsub!(",", " ")

    # call method not_a_word? to determine whether words contain any
    # non-letter characters like punctuation or numbers
    return "those aren't all words!" unless self.not_a_word?(list_of_words)
    
    array_of_words = list_of_words.split(" ")
    word_hash = {}

    array_of_words.each do |word|
      word_hash[word] = score(word)
    end

    word_hash
  end
end
