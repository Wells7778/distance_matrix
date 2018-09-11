class Distance < ApplicationRecord
  serialize :respond_list

  def self.geocode(address)
    url = 'https://maps.googleapis.com/maps/api/geocode/json'
    key = $settings['secret']
    params = {address: address, language: 'zh-TW', key: key }
    url = url + "?" + params.to_query
    json_rep = RestClient.get url
    #, {params: {address: address, language: 'zh-TW', key: key }} =>因放上heroku查詢字串有問題改用拼url方式測試
    respond = JSON.parse(json_rep)
    if respond['status'] == 'OK'
      return respond['results'][0]['formatted_address']
    else
      return nil
    end
  end
  def cal_distance
    url = 'https://maps.googleapis.com/maps/api/distancematrix/json'
    key = $settings['secret']
    current_code = self.post_code.to_i
    start_code = (( current_code / 10 ) - 1 ) * 10
    end_code = ((( current_code / 10 ) + 1 ) * 10) + 9
    if current_code > 94
      @destinations = Service.where(post_code: [start_code..end_code]).or(Service.where(post_code: [26..27]))
    elsif current_code > 25 and current_code < 28
      @destinations = Service.where(post_code: [start_code..end_code]).or(Service.where(post_code: [95..98]))
    elsif current_code == 0
      @destinations = Service.all
    else
      @destinations = Service.where(post_code: [start_code..end_code])
    end
    dest = @destinations.pluck(:lng, :lat).map { |t| t.join(",")}

    result = []

    @destinations.each do |destination|
      result << {'tag' => destination.tag, 'no' => destination.no, 'name' => destination.name, 'service_time' => destination.service_time }
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