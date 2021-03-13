class AddDefaultValueToStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :friendships, :status, :boolean, default: false
  end
end
