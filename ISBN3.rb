def valid_isbn?(isbn)
end 

def valid_isbn_length?(isbn)
	if isbn.length == 10 || isbn.length == 13
		true
	else
		false
	end
end