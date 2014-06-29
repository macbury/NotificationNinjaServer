class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :access_token
      t.string :name, null: false
      t.timestamps
    end
  end
end
