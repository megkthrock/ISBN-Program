def correct_isbn_length?(any_string)
	any_string.length == 10 or any_string.length == 13

end

def remove_dashes(any_string)
		any_string.delete!("-")
end

def remove_spaces(any_string)
		any_string.delete!(" ")
end

def valid_isbn?(any_string)
	 any_string.delete!("-")
	 any_string.delete!(" ")
	 contains_X(any_string)
	if correct_isbn_length?(any_string) == true && contains_non_digits?(any_string) == false
		true
	else
		false
	end
end

def contains_non_digits?(any_string)
	# indicates the position of the character, if none its nil
	if any_string =~ /\D/
		true
	else
		false
	end
end

def contains_X (any_string)
	if any_string.include?("x") || any_string.include?("X")
		true
	else
		false
	end
end













