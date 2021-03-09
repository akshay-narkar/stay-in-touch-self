class Addfkey < ActiveRecord::Migration[6.1]
  def change
      add_index(:friendships, :friend_id)
  end
end
