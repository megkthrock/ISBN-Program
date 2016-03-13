require "minitest/autorun"
require_relative "ISBN.rb"

class Test_ISBN_Number <Minitest::Test

	def test_isbn_length
		assert_equal(false, valid_isbn?("04719586970")) 
		assert_equal(false, valid_isbn?(""))
	end

	def test_length_is_10
		assert_equal(true, valid_isbn?("0471958697"))
	end

	def test_for_no_dashes
		assert_equal(true, valid_isbn?("978-0-471-48648-0"))
	end

	def test_that_spaces_are_removed
		assert_equal(true, valid_isbn?("978 0 471 48648 0"))
	end

	def test_example_data_with_dashes_and_spaces_is_valid_isbn
		assert_equal(true, valid_isbn?("978-0-471-48648-0"))
	end

	def test_13digit_isbn_contains_only_numbers
		assert_equal(false, valid_isbn?("978-0-471-48648-a"))
		assert_equal(true, valid_isbn?("978-0-471-48648-0"))
	end

	def test_10digits_cointains_X_as_last_digit
		num = contains_X("047195869x")
		assert_equal(10, num[9])
	end

	def test_that_10digits_is_valid
		assert_equal(true, check_digit_10_is_valid("128516590X"))
	end

	def test_that_13digits_is_valid
		assert_equal(true, check_digit_13_is_valid("9780470059029"))
		assert_equal(true, check_digit_13_is_valid("9780078025419"))
		assert_equal(false, check_digit_13_is_valid("1234567891234"))
		assert_equal(false, check_digit_13_is_valid("1234535678347"))
		assert_equal(true, check_digit_13_is_valid("9781429261784"))
	end
end













