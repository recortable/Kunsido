class Group < ActiveRecord::Base
  has_paper_trail :meta => {:resource => :name, :user => Proc.new {PaperTrail.whodunnit ? User.find(PaperTrail.whodunnit).name : nil}}

  belongs_to :user
  has_many :reunions
  has_many :memberships
  has_many :topics, :conditions => {:reunion_id => nil}

  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :body_mime, :presence => true

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
