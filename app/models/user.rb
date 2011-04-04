class User < ActiveRecord::Base
  has_paper_trail :meta => {:resource => :name, :user => Proc.new {PaperTrail.whodunnit ? User.find(PaperTrail.whodunnit).name : nil}}

  has_many :groups
  has_many :reunions, :conditions => {:group_id => nil}
  has_many :activity, :class_name => 'Version', :foreign_key => :whodunnit, :order => 'id DESC'
  has_many :topics, :conditions => {:group_id => nil, :reunion_id => nil}

  validates :name, :presence => true
  validates :email, :presence => true

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
