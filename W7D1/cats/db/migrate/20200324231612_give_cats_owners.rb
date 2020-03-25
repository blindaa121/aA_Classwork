class GiveCatsOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :user_id, :integer, foreign_key: true, null: false
  end
end
