class Admin::AdminController < ApplicationController

  before_filter :authenticate
  
  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
      username == "steve" && password == "just4now"
    end
  end

end