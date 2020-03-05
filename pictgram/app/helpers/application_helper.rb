# 参照：https://programming-beginner-zeroichi.jp/articles/142
# class ApplicationHelper < ApplicationController
  
#   include CommonActions
#   before_action :current_user, :logged_in?
    
# end

module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end