class Kairos
  def self.app_auth(app_id, image)
    app = App.find(app_id)
    response = KairosService.id_user(image, app.min_confidence)
    if response
      user = User.find(response['images']['transaction']['subject_id'])
      { authenticated: user_authorized(app, user), user: {
        name: user.first_name, email: user.email
        }}
    else
      no_love
    end

  end

  private

  def self.no_love
    {authenticated: false, error: 'Unable to find a face that matched an authorized user'}
  end

  def self.user_authorized(app, user)
    app.authorized_users.include?(user) ? true : false
  end
end
