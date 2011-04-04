class VersionsController < ApplicationController

  def show
    version = Version.find params[:id]
    begin

      case version.item_type
        when 'Topic'
          topic = Topic.find version.item_id
          redirect_to [topic.group, topic]
        when 'Comment'
          comment = Comment.find version.item_id
          topic = comment.topic
          redirect_to group_topic_path(topic.group, topic, :anchor => "h:c-#{comment.id}")
        else
          render :text => version.item_type
      end
    rescue ActiveRecord::RecordNotFound => e
      @versions = Version.where(:item_id => version.item_id, :item_type => version.item_type)
    end
  end

end
