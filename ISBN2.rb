def valid_isbn?(isbn)
	isbn_removed_characters = remove_dashes_and_spaces(isbn)
	contain_nondigits = isbn_containing_nondigits?(isbn_removed_characters)
	check_digit_10 = isbn_10_digit_check_sum(isbn)
	valid_check_digit_10 = isbn_10_digit_modulous_11(isbn)

	if isbn_removed_characters.length == 10 
		contain_nondigits == true && valid_check_digit_10 == true
	end
end

def isbn_length?(isbn)
	isbn.length == 10 or isbn.length == 13
end	

def remove_dashes_and_spaces(isbn)
	isbn = isbn.delete(" ")
	isbn = isbn.delete("-")
	isbn
end

def isbn_containing_x_deletes_x(isbn)
	isbn_array = isbn.split("")
	if isbn_array.length == 10 && isbn_array[9] == "X" || isbn_array[9] == "x"
		isbn_array.slice!(9)
		isbn_array
	else 
		isbn_array
	end
end

def add_x_back_into_isbn(isbn)
	isbn = isbn.split("")
	if isbn.length == 9
		isbn.push("X")
	end
	isbn = isbn.join
end

def isbn_containing_nondigits?(isbn)
	isbn_x_replaced_array = isbn_containing_x_deletes_x(isbn)
	isbn_x_replaced = isbn_x_replaced_array.join
	isbn_position_of_nondigit = isbn_x_replaced =~ /\D/
	if isbn_position_of_nondigit == nil
		true
	else
		false
	end
end

def isbn_10_digit_check_sum(isbn)
	isbn_array = isbn_containing_x_deletes_x(isbn) 
	sum = 0
	isbn_array.each_with_index do |value, position|
		break if position == 9
			sum += value.to_i * (position + 1)	
	end
	sum = sum % 11
end

def isbn_10_digit_modulous_11(isbn)
	sum = isbn_10_digit_check_sum(isbn)
	isbn = add_x_back_into_isbn(isbn)
	isbn = isbn.split("")
	if sum == 10 && isbn[9].upcase == "X"
		true
	elsif sum == isbn[9].to_i
		true
	else
		false
	end
end	

# def isbn_13_digit_check_sum















 
