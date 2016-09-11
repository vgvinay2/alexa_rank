class CreateSiteUrls < ActiveRecord::Migration
  def change
    create_table :site_urls do |t|
      t.string :site_name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
