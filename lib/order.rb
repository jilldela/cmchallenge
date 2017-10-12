require_relative '../cmdb.rb'
require 'byebug'

class Order
  attr_reader :orderID, :userID_customer, :userID_shop

  def initialize(orderID, userID_customer, userID_shop)
    @orderID = orderID
    @userID_customer = userID_customer
    @userID_shop = userID_shop
  end

  def matches?(params)
    @orderID == params["orderID"] && @userID_customer == params["userID_customer"] && @userID_shop == params["userID_shop"]
  end

  def self.find_order(orderID)
    execute(<<-SQL, orderID)
      SELECT
        *
      FROM
        orders
      WHERE
        orders.id = $1
      SQL
  end

end