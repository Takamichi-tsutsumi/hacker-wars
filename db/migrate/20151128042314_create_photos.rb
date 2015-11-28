class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :organization_id
      t.integer :category_id
      t.integer :season
      t.text :text

      t.timestamps null: false
    end
  end
end
