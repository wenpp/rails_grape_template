class User < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :authentication_token

      t.timestamps null: false
    end
    add_index :users, :username, unique: true
    add_index :users, :authentication_token, unique:true
  end
end
