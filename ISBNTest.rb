require "minitest/autorun"
require_relative "ISBN.rb"

class Test_ISBN_Number <Minitest::Test

	def test_isbn_length
		assert_equal(false, isbn_length("04719586970")) 
	end
end

 