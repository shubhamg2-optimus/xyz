class StatusPage
include PageObject
direct_url BASE_URL + "status"
link :linux_servers, :id => /frmTree:pnlTbSet:0:hstTree:6/
a :search_button, :id => /frmTree:pnlTbSet:0.2/
text_field :search_textfield, :id => /frmTree:pnlTbSet:0:STtxtSearchQuery/
button :go_search_button, :id => /frmTree:pnlTbSet:0:STsearchTreePortlet_btnSearch/
def hosts_under_linux_severs
sleep(3)
linux_server_hosts = Array.new
@browser.linux_servers.span.each do |hosts|
linux_server_hosts = hosts.text
return linux_server_hosts
end
end
end
