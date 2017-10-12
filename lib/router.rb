require_relative 'controller.rb'

class Router

  # specifically trying to match POST method and '/license-key' path
  def self.matches?(req)
    (:post == req.request_method.downcase.to_sym) && ("/license-key" == req.path)
  end

  def self.run(req, res)
    matching_route = self.matches?(req)

    if matching_route
      controller = Controller.new(req, res)
      controller.run
    else
      res.status = 404
    end
  end
end