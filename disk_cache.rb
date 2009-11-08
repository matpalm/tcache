require 'fileutils'

HASH_BUCKETS = 20

class DiskCache

	def initialize underlying_cache, cache_dir
		@underlying_cache = underlying_cache
		@cache_dir = cache_dir
		if !File.exists? cache_dir
			FileUtils.mkdir_p(cache_dir) 
			HASH_BUCKETS.times { |n| FileUtils.mkdir_p("#{cache_dir}/#{n}") }
		end
	end

	def get request
		cache_filename = cache_filename_for request
#		puts "DiskCache: cache_filename=#{cache_filename}"
		if File.exists? cache_filename
#			puts "DiskCache: on disk"
			return File.read cache_filename
		else
#			puts "DiskCache: not on disk"
			response = @underlying_cache.get request
			file = File.open cache_filename, 'w'
			file.puts response
			file.close
			return response
		end
	end

	def cache_filename_for request
		"#{@cache_dir}/#{request.id.to_i % HASH_BUCKETS}/#{request.key}" 
	end

end

