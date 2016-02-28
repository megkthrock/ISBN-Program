def isbn_length(any_string)
	any_string.length == 10 or any_string.length ==13

end

def remove_dashes(any_string)
	dashes = "-"
	if any_string.include? dashes
		any_string.delete! dashes
	
	end
end
