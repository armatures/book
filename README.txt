to start the database server:
	pg_ctl start -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log

to set up the database:
	createdb rhymebook 'a phonetic dictionary database as found at http://www.speech.cs.cmu.edu/cgi-bin/cmudict'
list databases:
	psql -l
to connect:
	psql rhymebook

todo: √ set up connection to db
	√ parse file (three columns: the word, its pronunciation, and its syllable count)
	√ fix the syllable_count function
	
	√ new rails app
	√ new word model (three properties)
	√ migrations to create word table
	√ rspec is working
	√ integrate ActiveRecord (it's in rails anyway)
	
	PG::SyntaxError: ERROR:  syntax error at or near "BOUT"
	insert into Words (spelling,pronunciation,syllables) values (''BOUT','B AW1 T', 1)

	rake task to populate db (seed db?)
	simple UI to be able to list rhymes (words for now)
	word should have find_by_spelling, etc.
	word should also get a find_by_phoneme method to look them up by phonemes
	
	maybe move to a sublimetext plugin (would have to move it all to python)
