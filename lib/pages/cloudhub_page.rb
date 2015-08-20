class CloudHubPage
    include PageObject

    direct_url BASE_URL + "groundwork-administration/cloudhubview"
   
	in_frame(:id => 'myframe') do |frame|
		radio_button :vmware, :id => /vmware/, :frame => frame
		radio_button :redhat, :id => /redhat/, :frame => frame

		#Modifications
		link :add_vmware, :href => /vmware/, :class => /button-l/, :frame => frame
		link :add_redhat, :href => /rhev/, :class => /button-l/, :frame => frame
		text_field :rh_display_name, :name => /common.displayName/, :frame => frame
		text_field :rh_groundwork_server, :name => /gwos.gwosServer/, :frame => frame		

		#Modification
		text_field :app_server, :name => /connection.server/, :frame => frame
		text_field :rh_entrypoint, :name => /connection.url/, :frame => frame
		text_field :rh_password, :name => /connection.password/, :frame => frame
		text_field :rh_storepath, :name => /connection.certificateStore/, :frame => frame
		text_field :rh_passcode, :name => /connection.certificatePassword/, :frame => frame
		text_field :rh_check_interval, :id => /check.interval/, :frame => frame
		text_field :rh_sync_interval, :id => /sync.interval/, :frame => frame
		
		text_field :display_name, :id => /common.displayName/, :frame => frame
		text_field :groundwork_server, :id => /groundwork.server.name/, :frame => frame
		text_field :conn_prefix, :name => /connection.prefix/, :frame => frame
		text_field :wsuser_name, :id => /groundwork.webservices.username/, :frame => frame
		

		#Modifications
		text_field :wsuser_password, :id => /groundwork.webservices.password/, :frame => frame
		text_field :server_name, :id => /virtualEnv.serverName/, :frame => frame
		text_field :tenant_id, :id => /virtualEnv.tenantId/, :frame => frame
		text_field :tenant_name, :id => /virtualEnv.tenantName/, :frame => frame
		text_field :nova_port, :id => /virtualEnv.novaPort/, :frame => frame
		text_field :keystone_port, :id => /virtualEnv.keystonePort/, :frame => frame
		text_field :ceilometer_port, :id => /virtualEnv.ceilometerPort/, :frame => frame
		text_field :connection_retries, :id => /connectionRetries/, :frame => frame
		
		#text_field :vmware_server, :id => /virtualEnv.serverName/, :frame => frame
		text_field :username, :id => /virtualEnv.username/, :frame => frame
		text_field :password, :name => /connection.password/, :frame => frame
		text_field :interval, :id => /check.interval/, :frame => frame
		
		button :add, :value => /Add/, :frame => frame
		button :save, :value => /Save/, :frame => frame
		button :test_connection, :value => /Test Connection/, :frame => frame
		button :next, :value => /Next/, :frame => frame
		button :home, :value => /Home/, :frame => frame
		button :startconnection, :id => /startStopServerbtn/, :frame => frame
		div :green, :class => /greencircle/, :frame => frame
		button :modify, :value => /Modify/, :frame => frame
		button :next, :value => /Next/, :frame => frame
		p :cloudhub, :text => /Cloud Hub Configuration wizard for VMware/, :frame => frame
		p :rh_cloudhub, :text => /CloudHub Configuration wizard for RHEV-M/, :frame => frame
		button :delete, :value => /Delete/, :frame => frame
		td :testconnection, :text => "test", :frame => frame
		checkbox :hypervisor_service, :id => /hyp_monitored_5/, :frame => frame
		button :save, :value => /Save/, :frame => frame
		checkbox :vm_service, :id => /vm_monitored_18/, :frame => frame
		
		text_field :hyp_warning_threshold, :id => /hyp_warningThreshold_1/, :frame => frame
		text_field :hyp_critical_threshold, :id => /hyp_criticalThreshold_1/, :frame => frame
		
		text_field :vm_warning_threshold, :id => /vm_warningThreshold_1/, :frame => frame
		text_field :vm_critical_threshold, :id => /vm_criticalThreshold_1/, :frame => frame
		
		checkbox :storage_view, :id => /storageView/, :frame => frame
		checkbox :network_view, :id => /networkView/, :frame => frame
		checkbox :resource_view, :id => /resourcePoolView/, :frame => frame
		
	end

def home_confirm
	@browser.frame(:id => "myframe").input(:value => /Home/).when_present.click
end


end
