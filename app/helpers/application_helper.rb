module ApplicationHelper
	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end

	def get_rank_data
		Rank.pluck("DATE(created_at)")
	end

	def get_global_rank site
		site.ranks.pluck(:global_rank).join(',') rescue 0
	end

	def get_local_rank site
	  site.ranks.pluck(:local_rank).join(',')  rescue 0
	end	
end
