require 'rubygems'
require 'memcache'

class MemCacheW	

	def initialize underlying_cache
		@underlying_cache = underlying_cache
		@memcache = MemCache::new 'localhost:11211'
	end

	def get request
#		puts "MemCache: get"
		response = @memcache[request.key]
		if response.nil?
#			puts "MemCache: miss, check underlying"
			response = @underlying_cache.get request
			@memcache[request.key] = response			
		end
		response
	end

end
