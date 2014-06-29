class AddSessionKeyToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :session_key, :string
    add_index :accounts, :session_key
  end
end
