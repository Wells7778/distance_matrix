class Search < ApplicationRecord
  # 搜尋地址先丟進Google轉換
  def self.geocode(address)
    url = 'https://maps.googleapis.com/maps/api/geocode/json?'
    key = $settings['secret']
    # 檢查參數是地址還是經緯度
    params = address.include?(",") ? { latlng: address, language: 'zh-TW', key: key } : { address: address, language: 'zh-TW', key: key }
    url = url + params.to_query
    json_res = RestClient.get url
    res = JSON.parse(json_res)
    if res['status'] == 'OK'
      geo_address = res['results'][0]['formatted_address']
      post_code = geo_address[0..1].to_i
      latlng = [ res['results'][0]['geometry']['location']['lat'], res['results'][0]['geometry']['location']['lng'] ].join(",")
      return { geo_address: geo_address, latlng: latlng, post_code: post_code }
    else
      return nil
    end
  end

  # 使用Distance Matrix API
  def self.get_distance(latlng, post_code)
    url = 'https://maps.googleapis.com/maps/api/distancematrix/json'
    key = $settings['secret']
    current_code = post_code.to_i
    start_code = (( current_code / 10 ) - 1 ) * 10
    end_code = ((( current_code / 10 ) + 1 ) * 10) + 9
    if current_code > 94
      origins = Service.where(post_code: [start_code..end_code]).or(Service.where(post_code: [26..27])).select(:id, :lat, :lng)
    elsif current_code > 25 and current_code < 28
      origins = Service.where(post_code: [start_code..end_code]).or(Service.where(post_code: [95..98])).select(:id, :lat, :lng)
    elsif current_code == 0
      origins = Service.select(:id)
    else
      origins = Service.where(post_code: [start_code..end_code]).select(:id, :lat, :lng)
    end
    origin_lists = origins.pluck(:lng, :lat).map { |item| item.join(",")}

    result = []

    origins.each do |origin|
      result << { id: origin.id }
    end
    i = 0
    while origin_lists.size > 0
      json_res = RestClient.get url, {params: {origins: origin_lists.slice!(0,25).join("|"), destinations: latlng , language: 'zh-TW', key: key }}
      respond = JSON.parse(json_res)
      res_array = respond['rows'].map{|item| item['elements']}
      res_array.each_with_index do |res, index|
        result[index + i * 25 ][:distance] = res[0]['distance']['value']
        result[index + i * 25 ][:status] = res[0]['status']
      end
      i += 1
    end
    return result
  end
end