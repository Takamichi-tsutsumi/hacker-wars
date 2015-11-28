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
#  public_from     :datetime
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
