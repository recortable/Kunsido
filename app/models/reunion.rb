class Reunion < ActiveRecord::Base
  has_paper_trail :meta => {:resource => :name,
                            :group_id => :group_id,
                            :group => Proc.new {|m| m.group.name},
                            :user => Proc.new { PaperTrail.whodunnit ? User.find(PaperTrail.whodunnit).name : nil }}



  belongs_to :group
  belongs_to :user
  has_many :topics


  validates :name, :presence => true
  validates :group_id, :presence => true
  validates :user_id, :presence => true
  validates :body_mime, :presence => true
end
