require 'mem_cache'
require 'disk_cache'
require 'twitter'

require 'user_info'
require 'friends'
require 'followers'

class TCache

	def initialize params
		disk_cache_dir = params[:disk_cache_dir] || 'cache'
		@cache = DiskCache.new(Twitter.new, disk_cache_dir)

		use_memcache = params[:use_memcache]
		use_memcache = true if use_memcache.nil?
		@cache = MemCacheW.new(@cache) if use_memcache
	end

	def user_info_for id
		JSON::parse(@cache.get(UserInfo.new(id)))
	end

	def name_for id
		user_info_for(id)['name']
	end
	
	def screen_name_for id
		user_info_for(id)['screen_name']
	end

	def num_friends_of id
		user_info_for(id)['friends_count']
	end

	def num_followers_of id
		user_info_for(id)['followers_count']
	end

	def friends_of id
		JSON::parse(@cache.get(Friends.new(id)))
	end

	def followers_of id
		JSON::parse(@cache.get(Followers.new(id)))
	end

end
