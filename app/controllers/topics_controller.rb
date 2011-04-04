# encoding: utf-8

class TopicsController < ApplicationController
  respond_to :html
  before_filter :require_user
  expose(:topics)
  expose(:topic)

  def new
  end

  def show
  end

  def edit

  end

  def update
    params[:topic][:body_mime] = 'markdown' if params[:topic][:body_mime].blank?
    topic = Topic.find(params[:id])
    flash[:notice] = 'Has modificado el tema de discusión' if topic.update_attributes(params[:topic])
    respond_with topic, :location => topic
  end

  def create
    complete_params params[:topic]
    topic = Topic.new(params[:topic])
    flash[:notice] = 'Has creado un nuevo tema de discusión.' if topic.save
    respond_with topic, :location => topic
  end

end
