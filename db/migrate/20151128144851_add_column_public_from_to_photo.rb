class AddColumnPublicFromToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :public_from, :datetime
  end
end
