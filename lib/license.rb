require_relative '../cmdb.rb'

class License
  attr_reader :userID, :licenseKey

  def initialize(params)
    @userID = params["userID_customer"].to_i
    @licenseKey = params["licenseKey"]
  end

  def add_licenseKey
    execute(<<-SQL, @userID, @licenseKey)
      INSERT INTO
        license_keys (userID, licenseKey)
      VALUES
        ($1, $2)
    SQL
  end

  def find_licenseKey
    execute(<<-SQL, @licenseKey)
      SELECT DISTINCT
        *
      FROM
        license_keys
      WHERE
        licenseKey = $1
    SQL
  end
  
end