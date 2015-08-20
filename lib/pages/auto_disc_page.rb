class AutodiscPage
include PageObject
direct_url BASE_URL + "auto-disc"
#changing the frame
in_frame(:id => 'myframe') do |frame|
button :delete_range, :value => 'delete range/filter', :frame => frame
button :confirm_delete_filter, :name => /yes/, :frame => frame
button :add_new_filters, :name => /add_filter/, :frame => frame
button :go ,:name => /go/, :frame => frame
button :start_new_discovery ,:name => /clear_discovery/, :frame => frame
button :confirm_go, :name => /go_discover/, :frame => frame
button :cancel_discovery, :value => /Cancel/, :frame => frame
button :close_discovery, :value => /Close/, :frame => frame
text_field :range_name, :name => /filter_name/, :frame => frame
text_field :range_pattern, :name => /filter_value/, :frame => frame
select_list :range_type, :name => /filter_type/, :frame => frame
radio_button :interactive, :value => /Interactive/, :frame => frame
radio_button :auto, :value => /Auto/, :frame => frame
radio_button :auto_commit, :value => /Auto-Commit/, :frame => frame
checkbox :accept_discovery, :name => /accept/, :frame => frame
table :discovered_hosts_table, :id => /reportTable/, frame =>frame
end
def delete_old_filter
while(self.delete_range_element.exists?)
            self.delete_range_element.click
	    sleep(3)
            self.confirm_delete_filter_element.when_present.click
sleep(5)
end
end
def add_filter(name, type, pattern)
self.range_name = name
self.range_type = type
self.range_pattern = pattern
self.add_new_filters
end
def discovered_elements
if(self.discovered_hosts_table.exists?)
host_array = Array.new
table.rows.each do |row|
row.cells.each do |cell|
if(cell.text.match(/Linux*/))
host_array << (cell-1).text
end
end
end
end
end
end
