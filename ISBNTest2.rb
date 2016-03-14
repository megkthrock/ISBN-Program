require "minitest/autorun"
require_relative "ISBN2.rb"

class Test_ISBN_number <Minitest::Test

	def test_isbn_length_of_10_and_13_is_valid?
		assert_equal(true, isbn_length?("9781429261784"))
	end

	def test_isbn_length
		assert_equal(true, isbn_length?("8771958699"))
		assert_equal(false, isbn_length?("8771958"))
	end

	def test_isbn_with_dashes_and_spaces_is_valid?
		assert_equal("9781429261784", remove_dashes_and_spaces("978-142 92617-84"))
		assert_equal("97814292617894", remove_dashes_and_spaces("978-1 4292617894"))
	end

	def test_dashes_and_spaces_are_being_removed
		assert_equal("8771958699", remove_dashes_and_spaces("87-719 586-99"))
	end

	def test_isbn_containing_x_is_still_valid?
		assert_equal(true, valid_isbn?("877195869x"))
	end
	
	def test_isbn_containing_characters_other_than_x_are_invalid?
		assert_equal(false, valid_isbn?("877195869t"))
	end

	def test_isbn_contains_characters
		assert_equal(true, isbn_containing_nondigits?("877195869x"))
	end

	def test_isbn10_check_sum
		assert_equal(3, isbn_10_digit_check_sum("123"))
	end

	def test_isbn_10_check_digit_is_same_as_last_position
		assert_equal(true, isbn_10_digit_modulous_11("0471958697"))
		assert_equal(true, isbn_10_digit_modulous_11("0321146530"))
		assert_equal(true, isbn_10_digit_modulous_11("877195869x"))
		assert_equal(true, valid_isbn?("877195869x"))
	end
end














