class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :role, null: false, default: "USER"
      t.string :password_digest, null: false
      t.datetime :last_login, null: true
      t.timestamps
    end
  end
end
