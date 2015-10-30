Neography.configure do |config|
  config.protocol = "http"
  config.server = ENV.fetch('NEO4J_SERVER',"neographytest.sb02.stations.graphenedb.com")
  config.port = ENV.fetch('NEO4J_PORT','24789').to_i
  config.directory = "" # prefix this path with '/'
  config.cypher_path = "/cypher"
  config.gremlin_path = "/ext/GremlinPlugin/graphdb/execute_script"
  config.log_file = "neography.log"
  config.log_enabled = false
  config.slow_log_threshold = 0 # time in ms for query logging
  config.max_threads = 20
  config.authentication = nil # 'basic' or 'digest'
  config.username = ENV.fetch('NEO4J_USERNAME','neography_test')
  config.password = ENV.fetch('NEO4J_PASSWORD','iDnl29kLz5FyMMe11PmV')
  config.parser = MultiJsonParser
  config.http_send_timeout = 1200
  config.http_receive_timeout = 1200
  config.persistent = true
end
