class KairosService
  @conn = Faraday.new('https://api.kairos.com')

  def self.enroll(enrollment)
    response = @conn.post do |req|
      req.url '/enroll'
      req.headers['Content-type'] = 'application/json'
      req.headers['app_id'] = ENV['kairos_app_id']
      req.headers['app_key'] = ENV['kairos_key']
      req.body = "{ \"image\": \"#{enrollment.image}\",
       \"subject_id\": \"#{enrollment.user_id}\",
        \"gallery_name\": \" #{ENV['kairos_gallery']} \"}"
    end
    response = JSON.parse(response.body)
    if !response['Errors']
      enrollment.update_attributes(response: response)
      enrollment.save
    else
      false
    end
  end

  def self.visual_auth(image, user_id)
    response = @conn.post do |req|
      req.url '/verify'
      req.headers['Content-type'] = 'application/json'
      req.headers['app_id'] = ENV['kairos_app_id']
      req.headers['app_key'] = ENV['kairos_key']
      req.body = "{ \"image\": \"#{image}\",
       \"subject_id\": \"#{user_id}\",
        \"gallery_name\": \" #{ENV['kairos_gallery']} \"}"
    end
    if !JSON.parse(response.body)['Errors']
      true if  JSON.parse(response.body)['images'][0]['transaction']['confidence'] > ENV['confidence'].to_f
    else
      false
    end
  end

  def self.id_user(image, threshold)
    response = @conn.post do |req|
      req.url '/recognize'
      req.headers['Content-type'] = 'application/json'
      req.headers['app_id'] = ENV['kairos_app_id']
      req.headers['app_key'] = ENV['kairos_key']
      req.body = "{ \"image\": \"#{image}\",
        \"gallery_name\": \" #{ENV['kairos_gallery']} \",
        \"threshold\": \" #{threshold} \"}"
    end
    if !JSON.parse(response.body)['Errors'] && !(JSON.parse(response.body)['images'].first['transaction']['status'] == 'failure')
      JSON.parse(response.body)
    else
      false
    end
  end

  def self.delist_all
    #this is a tool for devs to dump all enrollments at Kairos, use carefully
    @conn.post do |req|
      req.url '/gallery/remove'
      req.headers['Content-type'] = 'application/json'
      req.headers['app_id'] = ENV['kairos_app_id']
      req.headers['app_key'] = ENV['kairos_key']
      req.body = "{\"gallery_name\": \" #{ENV['kairos_gallery']} \"}"
    end
  end

end
