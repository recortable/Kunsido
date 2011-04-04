class Membership < ActiveRecord::Base
  has_paper_trail :meta => {:label => Proc.new {|membership| membersip.resource.name }}
end
