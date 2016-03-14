def valid_isbn?(isbn)
end 

def eliminate_invalid_characters(isbn)
	isbn.delete!(" ")
	isbn.delete!("-")
	isbn
end 

def remove_X_if_it_is_the_last_digit(isbn)
	array = isbn.split("")
	if isbn.length == 10 && array[9] == "X" || array[9] == "x"
		isbn.slice!(9)
		isbn
	else
		isbn
	end
end

def add_X_back_to_isbn(isbn)
	if isbn.length == 9
		isbn.push("X")
	end
	isbn = isbn.join
end

def isbn_contains_all_digits?(isbn)
	if isbn =~ /\D/
		false
	else
		true
	end
end

def sum_of_10_digit_isbn(isbn)
	array = isbn.split("")
	sum = 0
	array.each_with_index do |value, position|
		break if position == 9
		sum += value.to_i * (position + 1)
	end
	sum = sum % 11
end 








