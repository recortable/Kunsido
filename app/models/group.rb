class Group < ActiveRecord::Base
  has_paper_trail :meta => {:resource => :name, :user => Proc.new {PaperTrail.whodunnit ? User.find(PaperTrail.whodunnit).name : nil}}

  belongs_to :user
  has_many :reunions
  has_many :memberships
  has_many :topics do
    def orphan
      self.where(:reunion_id => nil)
    end
  end
  has_many :activity, :class_name => 'Version', :order => 'id DESC'


  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :body_mime, :presence => true

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
