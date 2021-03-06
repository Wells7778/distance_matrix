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

class Service < ApplicationRecord
  has_many :results
  has_many :lists, through: :results

  scope :active, -> { where(:status => true)}
end
