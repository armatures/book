# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require_relative '../lib/cmudict_parser'
# CmudictParser.parse


PhonemeType.find_or_create_by phoneme_type: 'affricate'
PhonemeType.find_or_create_by phoneme_type: 'aspirate'
PhonemeType.find_or_create_by phoneme_type: 'fricative'
PhonemeType.find_or_create_by phoneme_type: 'liquid'
PhonemeType.find_or_create_by phoneme_type: 'nasal'
PhonemeType.find_or_create_by phoneme_type: 'semivowel'
PhonemeType.find_or_create_by phoneme_type: 'stop'
PhonemeType.find_or_create_by phoneme_type: 'vowel'
