# == Schema Information
#
# Table name: interchanges
#
#  id         :integer          not null, primary key
#  name       :string
#  cityNW     :string
#  citySE     :string
#  km         :integer
#  coordsNW   :string
#  coordsSE   :string
#  freeway_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class InterchangeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
