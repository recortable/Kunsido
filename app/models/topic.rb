class Topic < ActiveRecord::Base
  has_paper_trail :meta => {:resource => :name,
                            :group_id => :group_id,
                            :group => Proc.new {|m| m.group.name},
                            :user => Proc.new { PaperTrail.whodunnit ? User.find(PaperTrail.whodunnit).name : nil }}

  belongs_to :user
  belongs_to :reunion
  belongs_to :group
  has_many :comments, :as => :resource

  validates :user_id, :presence => true
  validates :group_id, :presence => true
  validates :name, :presence => true
  validates :body_mime, :presence => true
end
