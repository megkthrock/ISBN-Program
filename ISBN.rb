def isbn_length(any_string)
	any_string.length == 10 or any_string.length == 13

end

def remove_dashes(any_string)
	dashes = "-"
	if any_string.include? dashes
		any_string.delete! dashes
	
	end
end

def remove_spaces(any_string)
	spaces = " "
	if any_string.include? spaces
		any_string.delete! spaces
	end
end

def valid_isbn?(any_string)
	dashless_isbn = remove_dashes(any_string)
	isbn_length(dashless_isbn)
end