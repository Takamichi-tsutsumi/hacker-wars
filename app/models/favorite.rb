# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  photo_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# お気に入りモデル
class Favorite < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: { scope: :photo_id }
  validates :photo_id, presence: true

	belongs_to :user
	belongs_to :photo
end
