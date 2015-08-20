class LoginPage
include PageObject
 direct_url BASE_URL1

    text_field :username, :class => 'fk-input login-form-input user-email'
    text_field :password, :class => 'fk-input login-form-input user-pwd'
    button :login_user, :class => 'submit-btn login-btn btn'
  def login(username, password)
 #@browser.text_field(:class,'fk-input login-form-input user-email').when_present.set username
 #@browser.input(:class,'fk-input login-form-input user-pwd').when_present.set password
#@browser.input(:class,'submit-btn login-btn btn').when_present.click
     self.username = username
        self.password = password
        self.login_user
    end
end

