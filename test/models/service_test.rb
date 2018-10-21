# == Schema Information
#
# Table name: services
#
#  id           :integer          not null, primary key
#  tag          :string
#  no           :string
#  name         :string
#  lng          :string
#  lat          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  post_code    :integer
#  service_time :string           default("00:00 ~ 00:00")
#  priority     :integer          default(0), not null
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
