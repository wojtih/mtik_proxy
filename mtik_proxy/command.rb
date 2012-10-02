#coding: utf-8
class MTikProxy::Command
  
  def initialize(device, action, args = {})
    @command = [action]
    args.each_pair { |k,v| @command << "=#{k}=#{v}" }
    @params = { host: device.ip, user: device.login, pass: device.password, command: @command }
  end

  def execute
    MTik::command(@params)
  end
end