class AddHeaderImageToOrganization < ActiveRecord::Migration
  def change
  	add_column :organizations, :header_image, :string
  end
end
