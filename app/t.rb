class T
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