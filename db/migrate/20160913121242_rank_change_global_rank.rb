class RankChangeGlobalRank < ActiveRecord::Migration
  def change
  	change_column(:ranks, :global_rank, :string, default: 0)
  	change_column(:ranks, :local_rank, :string, default: 0)
  end
end
