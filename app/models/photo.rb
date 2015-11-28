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

  validates :public_from, presence: true
  belongs_to :category
  belongs_to :organization
  has_many :favorites
  has_many :users, through: :favorites

  mount_uploader :image, PhotoImageUploader

  def favorited_by?(user)
    unless user
      p 'no user'
      return "false"
    end
    false
    return "true" if self.users.include?(user.id)
  end
end
