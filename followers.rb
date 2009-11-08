class Followers
	attr_reader :id

	def initialize id
		@id = id
	end

	def key
		"friends.#{id}.json"
	end

	def url
		"http://twitter.com/followers/ids.json?id=#{id}"
	end

end

