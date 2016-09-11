class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :global_rank
      t.integer :local_rank
      t.integer :site_url_id

      t.timestamps null: false
    end
  end
end
