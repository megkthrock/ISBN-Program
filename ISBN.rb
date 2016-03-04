def correct_isbn_length?(isbn)
	isbn.length == 10 or isbn.length == 13

end

def remove_dashes(isbn)
		isbn.delete!("-")
end

def remove_spaces(isbn)
		isbn.delete!(" ")
end

def valid_isbn?(isbn)
	 isbn.delete!("-")
	 isbn.delete!(" ")
	 contains_X(isbn)
	if correct_isbn_length?(isbn) == true && contains_non_digits?(isbn) == false
		true
	else
		false
	end
end

def contains_non_digits?(isbn)
	# indicates the position of the character, if none its nil
	if isbn =~ /\D/
		true
	else
		false
	end
end

def contains_X(isbn)
	isbn_number_array = isbn.split(//,)
	if isbn.include?("x") || isbn.include?("X")
		isbn[9] == 10
		true
	else
		false
	end
end

def check_digit_10_is_valid (isbn)
	array = []
	isbn.each do |value|
		array.push value.to_i
	end
	sum = 0 
	array.each.with_index do |value, index|
	break if index == 9 
		sum += value * (index + 1)
	end
	check_digit = sum % 11
	if check_digit == array[9]
		true
	else
		false
	end
	check_digit == array[9]

end











