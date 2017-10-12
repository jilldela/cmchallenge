require_relative 'order'
require_relative 'user'
require_relative 'license'
require 'byebug'

class Controller
  attr_reader :req, :res, :params

  def initialize(req, res)
    @req, @res = req, res
    @params = @req.params
  end

  def run
    orderID = @params["orderID"]
    match = Order.find_order(orderID)

    if match.empty?
      @res.status = 404
      @res.write('Order not found. Please make sure your order ID is correct.')
    else
      order = Order.new(*match.flatten)
      verify_order(order)
    end
  end

  # refactor
  def verify_order(order)
    @order = order

    if order.matches?(order_params)
      license = License.new(license_params)
      license.add_licenseKey
      increment_license_count

      match = User.find_user(@req.params["userID_customer"]).flatten
      @user = User.new(*match) unless match.empty?

      render("email") 
    else
      @res.status = 404
      @res.write("The shop ID and/or customer ID does not match Order ##{@order.orderID}.")
    end
  end

  def increment_license_count
    shop_match = User.find_user(@req.params["userID_shop"]).flatten
    @shop = User.new(*shop_match) unless shop_match.empty?
    @shop.increment_count
  end

  def order_params
    permit = ["orderID", "userID_customer", "userID_shop"]
    @params.select { |k, _| permit.include?(k) }
  end

  def license_params
    permit = ["userID_customer", "licenseKey"]
    @params.select { |k, _| permit.include?(k) }
  end


  def render(template_name)
    template_fname = "#{template_name}.html.erb"
  
    template_code = File.read(template_fname)
  
    render_content(
      ERB.new(template_code).result(binding),
      "text/html"
    )
  end

  def render_content(content, content_type)

    @res.write(content)
    @res['Content-Type'] = content_type

    nil
  end
end
