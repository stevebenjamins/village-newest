class AddVotingClosesToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :voting_closes, :datetime
  end
end
