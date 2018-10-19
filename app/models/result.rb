class Result < ApplicationRecord
  belongs_to :service
  belongs_to :distance

  store :respond, :accessors => [:distance, :duration, :status]
end
