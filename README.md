# MTik Proxy 

Lib to communicate with MTik router API (thorough command line tool)

## Example

device = Struct.new(:ip, :login, :password).new("127.0.0.1", "admin", "secret")

MTikProxy::Connection.new(device).ping
MTikProxy::Connection.new(device).get_ssid
MTikProxy::Connection.new(device).reboot!



## License

MIT License. Copyright 2012
