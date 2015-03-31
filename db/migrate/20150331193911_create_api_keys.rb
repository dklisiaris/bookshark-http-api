class CreateAPIKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :name
      t.string :key
      t.integer :requests_count
      t.string :last_request_ip
      t.date :last_reset_at      
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :api_keys, :key, unique: true
  end
end
