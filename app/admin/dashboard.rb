ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        panel "Recent Posts" do
         table_for User.all do
          column("Email") do |user|
            link_to user.email, edit_admin_user_path(user)
          end
          column("user limit") do |user|
           user.user_limlt
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
