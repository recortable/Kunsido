class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthModule
  layout 'public'

  helper_method :current_user, :signed_in?

  protected
  def self.edit_require_user
    before_filter :require_user, :except => [:index, :show]
  end
end
