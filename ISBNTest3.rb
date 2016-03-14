require "minitest/autorun"
require_relative "ISBN3.rb"

class Test_ISBN_Number <Minitest::Test

	def test_for_valid_length_of_isbn
		assert_equal(true, valid_isbn_length?("877195869x"))
		assert_equal(false, valid_isbn_length?("12345"))
		assert_equal(true, valid_isbn_length?("1232343456546"))
	end

	def test_that_invalid_characters_are_removed
		assert_equal("12345678", eliminate_invalid_characters("123 4 5-67-8"))
	end
end