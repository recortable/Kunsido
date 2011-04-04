class Membership < ActiveRecord::Base
  has_paper_trail :meta => {:resource => Proc.new {|m| m.member.name},
                            :group_id => :group_id,
                            :group => Proc.new {|m| m.group.name},
                            :user => Proc.new { PaperTrail.whodunnit ? User.find(PaperTrail.whodunnit).name : nil }}

  belongs_to :user
  belongs_to :group
  belongs_to :member, :class_name => 'User'

  def member_email
    member ? member.email : ''
  end

  def member_email=(email)
    puts "JODER 1 #{email}"
    member = User.retrieve(email)
    puts "JODER #{member.id}"
    self.member_id = member.id
  end

end
