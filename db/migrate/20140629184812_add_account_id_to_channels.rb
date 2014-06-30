class AddAccountIdToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :account_id, :integer, null: false
    add_index :channels, :account_id
  end
end
