class User < ActiveRecord::Base
  has_paper_trail

  validates :name, :presence => true
  validates :email, :presence => true
end
