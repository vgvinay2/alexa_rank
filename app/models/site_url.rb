class SiteUrl < ActiveRecord::Base
	belongs_to :user
	has_many :ranks  
	SITECOUNT = 3
end
