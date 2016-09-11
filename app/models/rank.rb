class Rank < ActiveRecord::Base
	belongs_to :site_url, dependent: :destroy
	scope :exists_rank, -> { where("DATE(created_at) = ?", Date.current) }  
end
