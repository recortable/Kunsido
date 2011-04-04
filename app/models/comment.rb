class Comment < ActiveRecord::Base
  has_paper_trail :meta => {:resource => Proc.new {|m| m.resource.name},
                            :group_id => :group_id,
                            :group => Proc.new {|m| m.group.name},
                            :user => Proc.new { PaperTrail.whodunnit ? User.find(PaperTrail.whodunnit).name : nil }}

  default_scope :order => 'id DESC'

  belongs_to :user
  belongs_to :group
  belongs_to :resource, :polymorphic => true

  validates :user_id, :presence => true
  validates :group_id, :presence => true
  validates :resource_id, :presence => true
  validates :body, :presence => true
  validates :body_mime, :presence => true

  def topic
    resource_type == 'Topic' ? resource : resource.topic
  end
end
