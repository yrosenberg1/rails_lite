require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies[:_rails_lite_app]
    if cookie
      @value = JSON.parse(cookie.val)
    else 
      @value = {}
    end

  end

  def [](key)
    @value[key]
  end

  def []=(key, val)
    @value[key] = val 
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
   cookie = JSON.parse(@value)
   res.set_cookie(:rails_little_app, cookie)
  end
end
