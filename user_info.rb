class UserInfo
	attr_reader :id

	def initialize id
		@id = id
	end

	def key
		"user_info.#{@id}.json"
	end

	def url
		"http://twitter.com/users/show.json?id=#{@id}"
	end

end
