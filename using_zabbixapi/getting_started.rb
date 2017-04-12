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
puts zbx
auth_token = zbx.client.instance_variable_get(:@auth_hash)
puts auth_token

# puts zbx.query(method: 'apiinfo.version', params: [])
# zbx.query(method: 'graph.get', params: []).each do |record|
#   puts record['graphid'] if record["name"].match("全体的なプロセス数")
# end

graphid = zbx.query(method: 'graph.get', params: []).first['graphid']
GRAPH_URL_TEMPLATE = "#{PROTOCOL}://#{DOMAIN}/chart2.php?graphid=#{graphid}&period=3600&width=800".freeze
cookie = 'zbx_sessionid=' + auth_token
headers = { 'Cookie' => cookie }
puts headers
open(GRAPH_URL_TEMPLATE, headers) do |file|
  puts file
end

# period  グラフ画像の期間(秒)
# stime グラフの開始時間(YYYYMMDDhhmmss)

# puts zbx.query(method: 'graphitem.get', params: []).first
# puts zbx.query(method: 'image.get', params: []).first
