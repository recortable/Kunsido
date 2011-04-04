class User < ActiveRecord::Base
  has_paper_trail :meta => {:resource => :name, :user => Proc.new { PaperTrail.whodunnit ? User.find(PaperTrail.whodunnit).name : nil }}

  has_many :groups
  has_many :reunions, :conditions => {:group_id => nil}
  has_many :activity, :class_name => 'Version', :foreign_key => :whodunnit, :order => 'id DESC'

  validates :name, :presence => true
  validates :email, :presence => true

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def self.retrieve(email)
    user = User.find_by_email(email)
    user ||= User.create(:name => email.split('@')[0], :email => email)
    user
  end


end
