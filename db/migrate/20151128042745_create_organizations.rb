class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :intro_text
      t.string :food_info
      t.string :site_info
      t.string :activity_info
      t.string :address
      t.text :temperture
      t.text :how_to_go

      t.timestamps null: false
    end
  end
end
