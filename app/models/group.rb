class Group < ActiveRecord::Base
  has_paper_trail :meta => {:resource => :name, :user => Proc.new {PaperTrail.whodunnit ? User.find(PaperTrail.whodunnit).name : nil}}

  belongs_to :user
  has_many :reunions
  has_many :memberships

  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :body_mime, :presence => true
end
