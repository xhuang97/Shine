class AddAdminOrganization < ActiveRecord::Migration
 def up
    shine = Organization.new
    shine.name = "Shine Registry"
    shine.for_profit = false
    shine.is_active = true
    shine.industry = 'Technology'
    shine.user_id = 1
    shine.verified = true
    shine.save!
  end

  def down
    shine = Organization.first
    Organization.delete shine
  end
end
