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
         column("Name") do |user|
           user.name
         end
         column("Admin") do |user|
           user.admin
         end
       end
     end
   end
 end
end
end
