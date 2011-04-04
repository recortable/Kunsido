# encoding: utf-8

class GroupsController < ApplicationController
  respond_to :html
  before_filter :require_user
  expose(:groups) { current_user.groups }
  expose(:group)

  def show
  end

  def new
  end

  def create
    complete_params params[:group]
    group = Group.new params[:group]
    flash[:notice] = 'Has creado un grupo.' if group.save
    respond_with group, :location => group
  end
end
