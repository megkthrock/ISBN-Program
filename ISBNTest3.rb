require "minitest/autorun"
require_relative "ISBN3.rb"

class Test_ISBN_Number <Minitest::Test

	def test_that_invalid_characters_are_removed
		assert_equal("12345678", eliminate_invalid_characters("123 4 5-67-8"))
	end

	def test_that_X_is_removed_from_last_position_10_digits
		assert_equal("877195869", remove_X_if_it_is_the_last_digit("877195869x"))
	end

	def test_if_isbn_containing_nondigits_is_invalid?
		assert_equal(false, isbn_contains_all_digits?("87719X5869"))
		assert_equal(false, isbn_contains_all_digits?("1234567y"))
		assert_equal(true, isbn_contains_all_digits?("87719586989"))
	end

	def test_isbn_10_digit_sum_mod_11
		assert_equal(3, sum_of_10_digit_isbn("123"))
		assert_equal(8, sum_of_10_digit_isbn("457126"))
	end

	def test_isbn_10_digit_check_digit_matches_sum?
		assert_equal(true, isbn_10_check_digit_matches_sum?("0471958697"))
		assert_equal(false, isbn_10_check_digit_matches_sum?("123456568"))
		assert_equal(true, isbn_10_check_digit_matches_sum?("877195869x"))
	end

	def test_isbn_13_digit_sum
		assert_equal(22, sum_of_13_digit_isbn("1234"))
		assert_equal(30, sum_of_13_digit_isbn("23436"))
	end

	def test_isbn_13_digit_check_digit_matches_sum?
		assert_equal(true, isbn_13_check_digit_matches_sum?("9780470059029"))
		assert_equal(false, isbn_13_check_digit_matches_sum?("4780470059028"))
	end












end