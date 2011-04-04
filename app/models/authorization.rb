class Authorization < ActiveRecord::Base
  has_paper_trail
  validates :provider, :presence => true
end
