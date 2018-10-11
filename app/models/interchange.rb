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

class Interchange < ApplicationRecord
  belongs_to :freeway
end
