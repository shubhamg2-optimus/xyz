class DashPage
    include PageObject
link :auto_disc, :text => /Auto Discovery/
    direct_url BASE_URL + "/portal/classic/"
end
