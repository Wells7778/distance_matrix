# == Schema Information
#
# Table name: freeways
#
#  id         :integer          not null, primary key
#  name       :string
#  direction  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Freeway < ApplicationRecord
  has_many :interchanges, dependent: :destroy
end
