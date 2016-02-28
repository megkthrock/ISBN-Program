require "minitest/autorun"
require_relative "ISBN.rb"

class Test_ISBN_Number <Minitest::Test

	def test_isbn_length
		assert_equal(false, isbn_length("04719586970")) 
		assert_equal(false, isbn_length(""))
	end

	def test_length_is_10
		assert_equal(true, isbn_length("0471958697"))
	end

	def test_for_no_dashes
		assert_equal("9780471486480", remove_dashes("978-0-471-48648-0"))
	end

	def test_that_spaces_are_removed
		assert_equal("9780471486480", remove_spaces("978 0 471 48648 0"))
	end

	def test_example_data_with_dashes_and_spaces_is_valid_isbn
		assert_equal(true, valid_isbn?("978-0-471-48648-0"))
	end

	# def test_
end

