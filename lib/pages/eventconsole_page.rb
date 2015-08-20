class EventconsolePage
    include PageObject

    direct_url BASE_URL + "console"

    link :filter_events_applications, :id =>/naviPanel:systemFilterTree:0/
    
    td :events_application_types, :class => /icePnlGrdCol1/, :index => 0

	link :applications_events, :id => /naviPanel:systemFilterTree:0/
    link :application_nagios_event, :text => /NAGIOS/
	link :host_groups_events, :id => /naviPanel:systemFilterTree:1/
    #link :service_groups_events, :id => /naviPanel:systemFilterTree:2/
    link :operation_status_events_open, :id => /naviPanel:systemFilterTree:3/
	link :operation_status_events, :id => /naviPanel:systemFilterTree:3/
	link :operation_status_events_accepted, :text => /ACCEPTED/
	link :operation_status_events_notified, :text => /NOTIFIED/
    link :host_groups_events, :id =>/naviPanel:systemFilterTree:1/
    link :open_filter, :text => "OPEN"
    link :close_filter, :text => "CLOSED"
	
	#for linux server --> localhost option inside Host Groups
	span :localhost, :text => /127.0.0.1/
	
    span :number_showing_events, :class => "iceOutFrmt"

    link :custom_group, :id => /naviPanel:systemFilterTree:n-1-0/

    div :children, :id => /naviPanel:systemFilterTree-d-1-0-c/
	link :all_events, :text => /All Events/
    link :last_10_nagios_critical, :text => /Last 10 Minutes NAGIOS Critical/
    link :last_5_snmptrap_warning, :text => /Last 5 SNMPTRAP Warning/
    link :nagios_warning, :text => /Nagios Warning/
    link :warnings, :text => /Warning/
    link :criticals, :text => /Critical/

    link :open_log_message, :text => /Open/, :id => /contentPanel:icepnltabset:0:j_id141/
    link :close_log_message, :text => /Close/
    link :accept_log_message, :text => /Accept/
    link :notify_log_message, :text => /Notify/
	
    text_field :message_search, :id => /searchEvents_messages/
    text_field :host_search, :id => /searchEvents_hosts/
    select :severity_search, :id => /searchEvents_severity/
    select :opstatus_search, :id => /searchEvents_opStatus/
    select :monstatus_search, :id => /searchEvents_monStatus/
    link :reset, :text => /Reset/
    link :search, :text => /Search/

    link :all_open_events, :text => "All Open Events"

    text_field :messages_search_box, :id => /contentPanel:icepnltabset:0:searchEvents_messages/
    text_field :messages_search_box_newtab, :id => /contentPanel:icepnltabset:1:searchEvents_messages/
    link :search_link, :text => /Search/

    span :new_tab, :text => "New tab"
    table :events_table, :id => /contentPanel:icepnltabset:0:eventTableID/

  #  link :SG1_link, :text => /SG1/
	link :LS_link, :text => /Linux Servers/
    div :page_title, :class => "BreadcumbsInfoBar ClearFix"
    span :page_text, :id => /contentPanel:icepnltabset:0:j_id56/

    button :close_tab, :name => /contentPanel:icepnltabset:1:j_id71/
	
	link :hostname, :href => "/portal-statusviewer/urlmap?host=baden"
	
	link :esx_bernina, :text => /ESX:bernina/
	link :esx_morges, :text => /ESX:morges/
	link :esx_thun, :text => /ESX:thun/
	link :esx_wil, :text => /ESX:wil/
	link :esx_zurich, :text => /ESX:zurich/
	link :vssvermont, :text => /VSS:vermont2/
	link :rhev_vm, :text => /RHEV-H:/
	link :rhev_m, :text => /RHEV-M:eng-rhev-m-1.groundwork.groundworkopensource.com/
	
	link :pool_view, :text => /POOL:/
	link :net_view, :text => /NET:/
	link :storage_view, :text => /STOR:/
	
	in_frame(:id => 'myframe') do |frame|
	span :esx_vssvermont, :text => /ESX:VSS:vermont2/, :frame => frame
	end
	
	link :vss_vermont, :text => /naviPanel:systemFilterTree:n-1-7:j_id22/
	span :cpu_usage, :id => /contentPanel:icepnltabset:0:eventTableID:0:txt_textMessage/
	link :esx_zurich, :text => /ESX:zurich.groundwork.groundworkopensource.com/
	span :cpu_uptime, :id => /contentPanel:icepnltabset:0:eventTableID:0:txt_textMessage/
	#link :rhev_vm, :text => /naviPanel:systemFilterTree:n-1-8:j_id22/
	#link :rhev_m, :text => /naviPanel:systemFilterTree:n-1-9:j_id22/
	
	
	#updating label of tab
	text_field :update_label, :name => /update_label/
	link :update_button, :text=> /Update Label/

	#All Events link under Filter Events
	link :all_events, :text => /All Events/
	
	#displaying error message on blank search
	span :error_message, :text => /Please enter atleast one search criteria to perform search/
	button :error_ok, :value => /OK/

	#Actions button and Nagios Acknowledge 
	span :actions, :text => /Actions/
	span :nagios_ack, :text => /Nagios Acknowledge/
	textarea :nagios_ack_comment, :name => /popupform/, :id => /popupText/
	button :nagios_ack_comment_button, :value => /Submit/
	
	#searching a device
	text_field :device, :name => /searchEvents_hosts/
	#searching a device by hostname in the table
	span :hosts_displayed, :id => /contentPanel:icepnltabset:0:eventTableID:0:j_id475/, :class => /iceOutTxt/
	
	link :show_event_tile_link, :text => /Show Event Tile/
	

    def filter_type(type)
        if type == "Host Group"
            self.host_groups_events
        elsif type == "Service Group"
            self.service_groups_events
        else
            self.operation_status_events
        end
    end

    def group_exists?(name,type)
        self.filter_type(type)
        self.custom_group_element.when_present.text == name
    end

    def check_events_message(message, tab)
        table = @browser.table(:id => /contentPanel:icepnltabset:#{tab}:eventTableID/).when_present
        size = table.rows.length - 2
        size.times do |current|
            self.wait_until do
                element = get_element(tab, current)
                element.text.include?(message)
            end
        end
		
        if tab == 1
            @browser.button(:src => "/portal-statusviewer/images/delete.png", :index => 1).click
            sleep(2)
        end

    end

    def get_element(tab, current)
        @browser.span(:id => /icepnltabset:#{tab}:eventTableID:#{current}:txt_textMessage/)
    end

    def check_event_status(host, status)
        #table = @browser.table(:id => "jbpns_2fgroundwork_2dmonitor_2fconsole_2fEventConsoleWindowsnpbj:contentPanel:icepnltabset:0:eventTableID").when_present
                table = @browser.table(:id => /contentPanel:icepnltabset:0:eventTableID/).when_dom_changed
        size = table.rows.length - 2
        size.times do |current|
            #if host == @browser.span(:id => "jbpns_2fgroundwork_2dmonitor_2fconsole_2fEventConsoleWindowsnpbj:contentPanel:icepnltabset:0:eventTableID:#{current}:j_id226").text
                        if host == @browser.span(:id => /contentPanel:icepnltabset:0:eventTableID:#{current}:j_id/).text
                self.wait_until do
                    #status == @browser.span(:id => "jbpns_2fgroundwork_2dmonitor_2fconsole_2fEventConsoleWindowsnpbj:contentPanel:icepnltabset:0:eventTableID:#{current}:txt_monitorStatus").text
                                        status == @browser.span(:id => /contentPanel:icepnltabset:0:eventTableID:#{current}:txt_monitorStatus/).text
                end
            end
        end
    end

	def event_status_verify(view)
		if view == "Storage View"
			self.storage_view_element.exists?.should == true
			self.storage_view_element.when_present.click
			sleep(5)
		
		elsif view == "Network View"
			self.net_view_element.exists?.should == true
			self.net_view_element.when_present.click
			sleep(5)
			
		elsif view == "Resource Pool"
			self.pool_view_element.exists?.should == true
			self.pool_view_element.when_present.click
			sleep(5)
		end
	end
	

	def verify_hoststatus_eventconsole(host,state)
		@browser.div(:id => /contentPanel:icepnltabset:0:eventTableID:0:pnl_host/).span(:id => /contentPanel:icepnltabset:0:eventTableID:0/,:text => /#{host}/).exists?.should == true
		@browser.div(:id => /contentPanel:icepnltabset:0:eventTableID:0:pnl_monitorStatus/).span(:id => /contentPanel:icepnltabset:0:eventTableID:0:txt_monitorStatus/,:text => /#{state}/).exists?.should == true
		puts @browser.div(:id => /contentPanel:icepnltabset:0:eventTableID:0:pnl_monitorStatus/).span(:id => /contentPanel:icepnltabset:0:eventTableID:0:txt_monitorStatus/,:text => /#{state}/).text
	end
end
