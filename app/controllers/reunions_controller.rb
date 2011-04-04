# encoding: utf-8

class ReunionsController < ApplicationController
  respond_to :html
  before_filter :require_user

  expose(:group) { load_group }
  expose(:reunions) { group.reunions }
  expose(:reunion)

  def show

  end

  def new

  end

  def create
    complete_params params[:reunion]
    reunion = group.reunions.build params[:reunion]
    flash[:notice] = 'Se ha añadido la reunión.' if reunion.save
    respond_with reunion, :location => [reunion.group, reunion]
  end

end
