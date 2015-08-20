class CentloginPage
include PageObject
direct_url BASE_URL2
text_field :user, :name =>"josso_username"
text_field :password, :name =>"josso_password"
button :logging, :value =>"Login"
def login(user, password)
self.user = user
self.password = password
self.logging
end
end
