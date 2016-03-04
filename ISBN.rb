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
	if isbn_number_array[9] == "x" || isbn_number_array[9] == "X"
		isbn_number_array[9] = 10
	end
	isbn_number_array
end

def check_digit_10_is_valid(isbn)
	array = []
	isbn = contains_X(isbn)
	isbn.each do |value|
		array << value.to_i
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
end

def check_digit_13_is_valid(isbn)
	array = []
	isbn = isbn.split("")
		isbn.each do |value|
		array << value.to_i
		end
	sum = 0 
	check_digit = 0

		array.each_with_index do |value, index|
			break if index == 12
			if index % 2 == 0
				sum += value * 1
			else
				sum += value * 3
			end
		end
	sum = sum % 10
	check_digit =(10 - sum)
		if isbn[12] == 10
		check_digit = 0		
		end
	array[12] == check_digit
end







