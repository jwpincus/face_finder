class KairosService
  @conn = Faraday.new('https://api.kairos.com')

  def self.enroll(enrollment)
    @conn.post do |req|
      req.url '/enroll'
      req.headers['Content-type'] = 'application/json'
      req.headers['app_id'] = ENV['kairos_app_id']
      req.headers['app_key'] = ENV['kairos_key']
      req.body = "{ \"image\": \"#{enrollment.image}\",
       \"subject_id\": \"#{enrollment.user_id}\",
        \"gallery_name\": \" devgallery \"}"
    end
  end

  def self.delist_all
    #this is a tool for devs to dump all enrollments at Kairos, use carefully
    @conn.post do |req|
      req.url '/gallery/remove'
      req.headers['Content-type'] = 'application/json'
      req.headers['app_id'] = ENV['kairos_app_id']
      req.headers['app_key'] = ENV['kairos_key']
      req.body = "{\"gallery_name\": \" devgallery \"}"
    end
  end

end
