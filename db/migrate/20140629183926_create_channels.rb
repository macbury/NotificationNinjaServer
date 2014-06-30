class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name, null: false
      t.string :subscription_token, null: false, limit: 24
      t.string :push_token, null: false, limit: 24

      t.timestamps
    end

    add_index :channels, :subscription_token, unique: true
    add_index :channels, :push_token, unique: true
  end
end
