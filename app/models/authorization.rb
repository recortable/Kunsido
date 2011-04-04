class Authorization < ActiveRecord::Base
  has_paper_trail :meta => {:label => :provider}

  validates :provider, :presence => true
end
