class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.references :pictureable, polymorphic: true

      t.timestamps
    end
    add_index :pictures, :pictureable_id
  end
end
