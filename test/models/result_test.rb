# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  service_id :integer
#  list_id    :integer
#  distance   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string
#

require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
