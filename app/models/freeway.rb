class Freeway < ApplicationRecord
  has_many :interchanges, dependent: :destroy
end
