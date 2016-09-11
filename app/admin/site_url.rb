ActiveAdmin.register SiteUrl do

index do
	
	 column :site_name
	 column :email do |timesheet|
      timesheet.user.email
    end
	end

end
