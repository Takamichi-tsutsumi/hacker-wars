class Photo < ActiveRecord::Base
  belongs_to :category
  belongs_to :organization
end
