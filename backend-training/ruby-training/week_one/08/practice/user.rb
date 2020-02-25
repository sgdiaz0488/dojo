# frozen_string_literal: true

class User
  attr_reader :login, :avatar, :url
  LOGIN = 'Login'
  AVATAR_URL = 'Avatar'
  HTML_URL = 'Url'

  def initialize(row)
    @login = row[LOGIN]
    @avatar = row[AVATAR_URL]
    @url = row[HTML_URL]
  end
end
