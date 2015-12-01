# == Schema Information
#
# Table name: organizations
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  intro_text    :text(65535)
#  food_info     :string(255)
#  site_info     :string(255)
#  activity_info :string(255)
#  address       :string(255)
#  temperture    :text(65535)
#  how_to_go     :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Organization < ActiveRecord::Base
  validates :name, presence: true
  validates :intro_text, presence: true
  validates :food_info, presence: true
  validates :site_info, presence: true
  validates :activity_info, presence: true
  validates :address, presence: true
  validates :how_to_go, presence: true
  validates :temperture, presence: true

	has_many :photos
	mount_uploader :header_image, PhotoImageUploader
end
