class AddTotalRequestsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_requests, :integer, default: 0
  end
end
