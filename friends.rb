class Friends
	attr_reader :id

	def initialize id
		@id = id
	end

	def key
		"friends.#{id}.json"
	end

	def url
		"http://twitter.com/friends/ids.json?id=#{id}"
	end

end
