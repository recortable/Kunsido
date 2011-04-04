class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthModule
  layout 'public'

  helper_method :current_user, :signed_in?

  protected
  def self.edit_require_user
    before_filter :require_user, :except => [:index, :show]
  end

  def user_for_paper_trail
    current_user ? current_user.id : nil
  end

  def complete_params(params)
    params[:body_mime] = 'markdown' if params[:body_mime].blank?
    params[:user_id] = current_user.id
  end

  def load_group
    Group.find params[:group_id]
  end

end
