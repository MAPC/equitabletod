def copy_filedata(filepath, table_name)
  
  conn = ActiveRecord::Base.connection_pool.checkout
  raw  = conn.raw_connection

  lines   = IO.readlines(filepath)
  # lines.shift

  result = raw.copy_data "COPY #{table_name} FROM STDIN WITH ( FORMAT CSV, HEADER true )" do
    lines.each {|line| raw.put_copy_data(line) }
  end

  count = conn.select_value("SELECT COUNT(*) FROM #{table_name}").to_i

  # while res = raw.get_result do; end # very important to do this after a copy
  ActiveRecord::Base.connection_pool.checkin(conn)
end