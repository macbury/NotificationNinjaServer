class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :uid, default: :null
      t.string :system, default: :null
      t.string :registration_id, default: :null

      t.timestamps
    end
  end
end
