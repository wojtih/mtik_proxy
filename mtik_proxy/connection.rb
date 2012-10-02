class MTikProxy::Connection  
  def initialize(device)
    @device = device
  end

  def set_ssid(val)
    Timeout::timeout(3) { MTikProxy::Command.new(@device, '/interface/wireless/set', { :ssid => val, ".id" => "wlan1" }).execute }
  rescue
    nil    
  end

  def get_wireless_info
    MTikProxy::Command.new(@device, '/interface/wireless/print').execute
  end

  def get_ssid
    Timeout::timeout(3) { get_wireless_info.first.first["ssid"] }
  rescue
    nil
  end

  def get_vpn_info
    MTikProxy::Command.new(@device, '/interface/l2tp-client/print').execute
  end

  def get_3g_info
    MTikProxy::Command.new(@device, '/interface/ppp-client/print').execute
  end

  def get_system_info
    MTikProxy::Command.new(@device, '/system/resource/print').execute
  end

  def get_ip_route_info
    MTikProxy::Command.new(@device, '/ip/route/print').execute
  end

  def get_ip_address_info
    resp = MTikProxy::Command.new(@device, '/ip/address/print').execute
  end
  
  def beep
    MTikProxy::Command.new(@device, '/beep').execute
  end

  def ping
    true if Timeout::timeout(2) { get_ip_address_info }    
  rescue Timeout::Error, Errno::ECONNREFUSED, Errno::ECONNRESET, MTik::Error
    false
  end

  def reboot!
    Timeout::timeout(3) do
      MTikProxy::Command.new(@device, '/system/reboot').execute
    end
  rescue Timeout::Error, Errno::ECONNREFUSED, Errno::ECONNRESET
    true
  end
end