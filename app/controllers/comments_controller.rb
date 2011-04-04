class CommentsController < ApplicationController
  respond_to :html
  before_filter :require_user

  expose(:comment)

  def edit
  end

  def create
    complete_params params[:comment]
    comment = Comment.new params[:comment]
    flash[:notice] = 'Se ha publicado tu comentario.' if comment.save
    topic = comment.topic
    respond_with comment, :location => [topic.group, topic]
  end

  def update
    comment = Comment.find params[:id]
    flash[:notice] = 'Se ha actualizado tu comentario.' if comment.update_attributes(params[:comment])
    topic = comment.topic
    respond_with comment, :location => [topic.group, topic]
  end

  def destroy
    comment = Comment.find params[:id]
    flash[:notice] = 'Se ha borrado tu comentario.' if comment.destroy
    topic = comment.topic
    respond_with comment, :location => [topic.group, topic]
  end
end
