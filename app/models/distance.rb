class Distance < ApplicationRecord
  serialize :respond_list

  def self.geocode(address)
    url = 'https://maps.googleapis.com/maps/api/geocode/json'
    key = 'AIzaSyCVtWcyzFy4AZBR7QMMdHUSG3maUcHieeo'
    json_rep = RestClient.get url, {params: {address: address, language: 'zh-TW', key: key }}
    respond = JSON.parse(json_rep)
    if respond['status'] = 'OK'
      return respond['results'][0]['formatted_address']
    end
  end
  def cal_distance
    url = 'https://maps.googleapis.com/maps/api/distancematrix/json'
    key = 'AIzaSyCVtWcyzFy4AZBR7QMMdHUSG3maUcHieeo'
    @destinations = Service.all
    dest = @destinations.pluck(:lng, :lat).map { |t| t.join(",")}

    result = []

    @destinations.each do |destination|
      result << {'tag' => destination.tag, 'no' => destination.no, 'name' => destination.name }
    end
    i = 0
    while dest.size > 0
      json_rep = RestClient.get url, {params: {origins: self.geo_address, destinations: dest.slice!(0,25).join("|") , language: 'zh-TW', key: key }}
      respond = JSON.parse(json_rep)
      rep_array = respond['rows'][0]['elements']
      rep_array.each_with_index do |rep, index|
        result[index + i * 25 ] ['distance'] = rep['distance']['value']
      end
      i += 1
    end
    return result
  end
end