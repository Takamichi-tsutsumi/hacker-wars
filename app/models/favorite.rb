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

class Favorite < ActiveRecord::Base
	validates :user_id, uniqueness: {scope: [:photo_id]}
	belongs_to :user
	belongs_to :photo
end
