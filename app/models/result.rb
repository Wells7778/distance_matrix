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

class Result < ApplicationRecord
  belongs_to :service
  belongs_to :list
end
