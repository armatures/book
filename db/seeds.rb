# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative '../lib/cmudict_parser'

affricate = PhonemeType.find_or_create_by phoneme_type: 'affricate'
aspirate = PhonemeType.find_or_create_by phoneme_type: 'aspirate'
fricative = PhonemeType.find_or_create_by phoneme_type: 'fricative'
liquid = PhonemeType.find_or_create_by phoneme_type: 'liquid'
nasal = PhonemeType.find_or_create_by phoneme_type: 'nasal'
semivowel = PhonemeType.find_or_create_by phoneme_type: 'semivowel'
stop = PhonemeType.find_or_create_by phoneme_type: 'stop'
vowel = PhonemeType.find_or_create_by phoneme_type: 'vowel'

Phoneme.find_or_create_by spelling: 'AA', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'AE', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'AH', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'AO', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'AW', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'AY', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'B', phoneme_type: stop
Phoneme.find_or_create_by spelling: 'CH', phoneme_type: affricate
Phoneme.find_or_create_by spelling: 'D', phoneme_type: stop
Phoneme.find_or_create_by spelling: 'DH', phoneme_type: fricative
Phoneme.find_or_create_by spelling: 'EH', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'ER', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'EY', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'F', phoneme_type: fricative
Phoneme.find_or_create_by spelling: 'G', phoneme_type: stop
Phoneme.find_or_create_by spelling: 'HH', phoneme_type: aspirate
Phoneme.find_or_create_by spelling: 'IH', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'IY', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'JH', phoneme_type: affricate
Phoneme.find_or_create_by spelling: 'K', phoneme_type: stop
Phoneme.find_or_create_by spelling: 'L', phoneme_type: liquid
Phoneme.find_or_create_by spelling: 'M', phoneme_type: nasal
Phoneme.find_or_create_by spelling: 'N', phoneme_type: nasal
Phoneme.find_or_create_by spelling: 'NG', phoneme_type: nasal
Phoneme.find_or_create_by spelling: 'OW', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'OY', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'P', phoneme_type: stop
Phoneme.find_or_create_by spelling: 'R', phoneme_type: liquid
Phoneme.find_or_create_by spelling: 'S', phoneme_type: fricative
Phoneme.find_or_create_by spelling: 'SH', phoneme_type: fricative
Phoneme.find_or_create_by spelling: 'T', phoneme_type: stop
Phoneme.find_or_create_by spelling: 'TH', phoneme_type: fricative
Phoneme.find_or_create_by spelling: 'UH', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'UW', phoneme_type: vowel
Phoneme.find_or_create_by spelling: 'V', phoneme_type: fricative
Phoneme.find_or_create_by spelling: 'W', phoneme_type: semivowel
Phoneme.find_or_create_by spelling: 'Y', phoneme_type: semivowel
Phoneme.find_or_create_by spelling: 'Z', phoneme_type: fricative
Phoneme.find_or_create_by spelling: 'ZH', phoneme_type: fricative

class Escaper
  def self.escape(str)
    ret_str = []
    str.each_char do |c|
      if c == "'"
        ret_str << "''"
      else
        ret_str << c
      end
    end
    ret_str.join
  end
end

words = CmudictParser.parse('/Users/charliebevis/workspace/rails_rhymebook/lib/cmudict/cmudict.0.7a')
values = []
words.each do |word|
  values << "('#{Escaper.escape(word[:spelling])}','#{word[:pronunciation]}', #{word[:syllables]})"
end
connection = ActiveRecord::Base.connection
connection.execute "insert into Words (spelling,pronunciation,syllables) values #{values.join(',')}"

