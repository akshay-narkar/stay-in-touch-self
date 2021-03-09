class Addindex < ActiveRecord::Migration[6.1]
  def change
          add_index(:friendships, :user_id)

  end
end
