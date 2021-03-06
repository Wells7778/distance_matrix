# == Schema Information
#
# Table name: lists
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

class List < ApplicationRecord
  has_many :results, dependent: :destroy do
    def priority_service
      where("distance < ?", 25999).where("priority > ?", 0).order(priority: :desc).order(distance: :asc)
    end
  end
  has_many :services, through: :results

  after_create :update_results
  private
  def update_results
    Search.get_distance(self.latlng, self.post_code).each do |res|
      priority = Service.find_by(id: res[:id]).priority
      self.results.create(service_id: res[:id], distance: res[:distance].to_i, status: res[:status], priority: priority)
    end
  end
end
