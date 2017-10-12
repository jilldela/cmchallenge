require 'pg'
require 'byebug'

def execute(sql, *args)
  conn = PG::Connection.open(:dbname => 'cmdb')
  query_result = conn.exec_params(sql, args).values
  conn.close

  query_result
end