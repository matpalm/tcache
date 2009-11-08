require 'curl'
require 'rate_limiter'

class Twitter

	def initialize
		@rate_limiter = RateLimiter.new
	end

	def get request
#		puts "Twitter: checkpoint"
		@rate_limiter.checkpoint
#		puts "Twitter: fetch"
		curl request.url
	end

end
