class DropContactMessages < ActiveRecord::Migration
  def up
    drop_table :contact_messages
  end

  def down
    create_table :contact_messages do |t|
      t.string :name
      t.string :email
      t.text :body
      t.string :subject
      t.string :topic

      t.timestamps
    end
  end
end
