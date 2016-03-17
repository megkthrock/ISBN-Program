def valid_isbn?(isbn)
  isbn_without_invalid_characters = eliminate_invalid_characters(isbn)

  if isbn_without_invalid_characters.length == 10
    valid_isbn_for_10_digits?(isbn_without_invalid_characters)
  elsif isbn_without_invalid_characters.length == 13 
    valid_isbn_for_13_digits?(isbn_without_invalid_characters)
  else
    false
  end
end

def valid_isbn_for_10_digits?(isbn)
   isbn_without_invalid_characters = eliminate_invalid_characters(isbn)
   isbn_x_removed = remove_X_if_it_is_the_last_digit(isbn_without_invalid_characters)
   isbn_containing_only_digits = isbn_contains_all_digits?(isbn_x_removed)
   isbn_without_invalid_characters = add_X_back_to_isbn(isbn_x_removed)
   isbn_sum_of_10 = sum_of_10_digit_isbn(isbn_without_invalid_characters)
   isbn_10_check = isbn_10_check_digit_matches_sum?(isbn_without_invalid_characters)
   isbn_containing_only_digits == true &&  isbn_10_check == true
end

def valid_isbn_for_13_digits?(isbn)
   isbn_without_invalid_characters = eliminate_invalid_characters(isbn)
   isbn_containing_only_digits = isbn_contains_all_digits?(isbn_without_invalid_characters)
   isbn_13_sum = sum_of_13_digit_isbn(isbn_without_invalid_characters)
   isbn_13_check = isbn_13_check_digit_matches_sum?(isbn_without_invalid_characters)
   isbn_containing_only_digits    == true && isbn_13_check == true
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
   else 
       isbn
   end
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

def isbn_10_check_digit_matches_sum?(isbn)
   array = isbn.split("")
   sum = sum_of_10_digit_isbn(isbn)
   if sum == 10 && array[9] == "X" || array[9] == "x"
       true
   elsif array[9].to_i == sum
       true
   else
       false
   end
end

def sum_of_13_digit_isbn(isbn)
   array = isbn.split("")
   sum = 0
   array.each_with_index do |value, position|
       break if position == 12
       if position % 2 == 0
           sum += value.to_i
       else 
           sum += value.to_i * 3
       end
   end
   sum
end

def isbn_13_check_digit_matches_sum?(isbn)
   array = isbn.split("")
   sum = sum_of_13_digit_isbn(isbn)
   sum = sum % 10
   sum = 10 - sum
   sum = sum % 10
   isbn[12].to_i == sum
end