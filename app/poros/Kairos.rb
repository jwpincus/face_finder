class Kairos
  def self.app_auth(app_key, image)
    app = App.find_by(app_key: app_key)
    response = KairosService.id_user(image, app.min_confidence)
    if response
      user = User.find(response['images'].first['transaction']['subject_id'])
      authorized = user_authorized(app, user)
      if authorized
        Authentication.create(app: app, user: user)
        { authenticated: authorized, user: {
          name: user.first_name, email: user.email
        }}
      else
        no_match
      end
    else
      no_match
    end

  end

  private

  def self.no_match
    {authenticated: false, error: 'Unable to find a face that matched an authorized user'}
  end

  def self.user_authorized(app, user)
    app.authorized_users.include?(user) ? true : false
  end
end
