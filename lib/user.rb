require_relative '../cmdb.rb'
require 'byebug'

class User
  attr_reader :id, :emailAddress
  attr_accessor :numLicenseKeysSent

  def initialize(userID, emailAddress, numLicenseKeysSent = nil)
    @id = userID
    @emailAddress = emailAddress
    @numLicenseKeysSent = (numLicenseKeysSent.nil? ? 0 : numLicenseKeysSent.to_i)
  end

  def increment_count
    @numLicenseKeysSent += 1

    execute(<<-SQL, @numLicenseKeysSent, @id)
      UPDATE
        users
      SET
        numLicenseKeysSent = $1
      WHERE
        id = $2
    SQL
  end
  
  def self.find_user(id)
    execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id = $1
    SQL
  end
end