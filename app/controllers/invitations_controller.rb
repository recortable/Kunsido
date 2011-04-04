class InvitationsController < ApplicationController
  expose(:email) { params[:email] }
  def create
    email = params[:email]
    user = User.retrieve(email)
  end
end
