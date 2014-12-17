# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative '../lib/cmudict_parser'

PhonemeType.find_or_create_by phoneme_type: 'affricate'
PhonemeType.find_or_create_by phoneme_type: 'aspirate'
PhonemeType.find_or_create_by phoneme_type: 'fricative'
PhonemeType.find_or_create_by phoneme_type: 'liquid'
PhonemeType.find_or_create_by phoneme_type: 'nasal'
PhonemeType.find_or_create_by phoneme_type: 'semivowel'
PhonemeType.find_or_create_by phoneme_type: 'stop'
PhonemeType.find_or_create_by phoneme_type: 'vowel'

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

