class Message < ActiveRecord::Migration
  def change
  	create_table :message do |t|
      t.belongs_to :user, index: true
      t.text :message

      t.timestamps null: false
    end
  end
end
