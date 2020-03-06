class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  # 参照：https://programming-beginner-zeroichi.jp/articles/142
  # module CommonActions
  #   extend ActiveSupport::Concern
    
  #   def current_user
  #     @current_user ||= User.find_by(id: session[:user_id])
  #   end
    
  #   def logged_in?
  #     !current_user.nil?
  #   end
  # end
  
  helper_method :current_user, :logged_in?
  # 参照:https://qiita.com/Toshimatsu/items/9875e6abfcf31b175a5a
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
end