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
end