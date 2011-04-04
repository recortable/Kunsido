# encoding: utf-8
class MembershipsController < ApplicationController
  before_filter :require_user
  respond_to :html

  expose(:group) { load_group }
  expose(:memberships) { group.memberships }
  expose(:membership)

  def index

  end

  def new

  end

  def create
    params[:membership][:user_id] = current_user.id
    membership = group.memberships.create params[:membership]
    flash[:notice] = "Has añadido a #{membership.member.name} al grupo '#{group.name}'" if membership.save
    respond_with membership, :location => group
  end



end
