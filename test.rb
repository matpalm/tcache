require 'tcache.rb'

me = 26970530
tc = TCache.new
puts (tc.user_info_for me).inspect
puts (tc.name_for me).inspect
puts (tc.screen_name_for me).inspect
puts (tc.num_friends_of me).inspect
puts (tc.num_followers_of me).inspect
puts (tc.friends_of me).inspect
puts (tc.followers_of me).inspect
