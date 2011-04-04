class Reunion < ActiveRecord::Base
  has_paper_trail :meta => {:label => :name}

  belongs_to :user

  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :body_mime, :presence => true
end