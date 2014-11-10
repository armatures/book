require 'cmudict_parser'
class ImportDictionary < ActiveRecord::Migration
  def up
  	words = CmudictParser.parse('/Users/charliebevis/workspace/rails_rhymebook/lib/cmudict/cmudict.0.7a')
  	# execute "insert into Words (spelling,pronunciation,syllables) values ('''BOUT','B AW1 T', 1)"
    values = []
    words.each do |word| 
	  	# execute "insert into Words (spelling,pronunciation,syllables) values ('TESTWORD','T EH1 S T W ER0 D', 2), ('TESTWORD2','T EH1 S T W ER0 D T OO0', 3)"
	  	# move this to one sql insert instead of one per row.
	  	values << "('#{escape(word[:spelling])}','#{word[:pronunciation]}', #{word[:syllables]})"
  	end
    execute "insert into Words (spelling,pronunciation,syllables) values #{values.join(',')}"
	end
  def down
		execute "DELETE FROM Words"  
  end

  def escape(str)
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
