class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_last_action
  after_filter 	:flash_time


  private
  def set_last_action
  	session[:last_action] = Time.now.strftime("%r")
  end
  def flash_time
  	flash[:notice] = session[:last_action]
  end
end
