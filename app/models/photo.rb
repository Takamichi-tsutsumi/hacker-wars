# == Schema Information
#
# Table name: photos
#
#  id              :integer          not null, primary key
#  image           :string(255)
#  organization_id :integer
#  category_id     :integer
#  season          :integer
#  text            :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Photo < ActiveRecord::Base
  belongs_to :category
  belongs_to :organization
  has_many :favorite

  mount_uploader :image, PhotoImageUploader
end