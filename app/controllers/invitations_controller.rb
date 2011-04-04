class InvitationsController < ApplicationController
  expose(:email) { params[:email] }
  def create
    email = params[:email]
    user = User.find_by_email(email)
    unless user
      user = User.create(:name => email.split('@')[0], :email => email)
    end
  end
end
