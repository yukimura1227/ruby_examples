require 'zabbixapi'

PROTOCOL    = 'XXX'.freeze
DOMAIN      = 'XXX'.freeze
ZABBIX_USER = 'XXX'.freeze
ZABBIX_PASS = 'XXX'.freeze
BASIC_USER  = 'XXX'.freeze
BASIC_PASS  = 'XXX'.freeze
zbx = ZabbixApi.connect(
  url:           "#{PROTOCOL}://#{DOMAIN}/api_jsonrpc.php",
  user:          ZABBIX_USER,
  password:      ZABBIX_PASS,
  http_user:     BASIC_USER,
  http_password: BASIC_PASS
)

puts zbx.query(method: 'apiinfo.version', params: [])
