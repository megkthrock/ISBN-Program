require "minitest/autorun"
require_relative "ISBN3.rb"

class Test_ISBN_Number <Minitest::Test

	def test_for_valid_length_of_isbn
		assert_equal(true, valid_isbn_length?("877195869x"))
		assert_equal(false, valid_isbn_length?("12345"))
	end
end