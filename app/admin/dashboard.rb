ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "All User" do
         table_for User.all do
          column("Email") do |user|
            link_to user.email, edit_admin_user_path(user)
          end
         column :site_name do |timesheet|
             timesheet.site_urls.pluck(:site_name).join(' ') 
          end
         column("Admin") do |user|
           user.admin== true ?  status_tag( "yes", :ok ) : status_tag( "no" )
         end
       end
     end
   end
 end
end
end
