# == Schema Information
#
# Table name: distances
#
#  id           :integer          not null, primary key
#  address      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  respond_list :text
#  geo_address  :text
#  post_code    :string
#  latlng       :string
#

require 'test_helper'

class DistanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
