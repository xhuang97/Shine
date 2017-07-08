class UserRegistries < ActiveRecord::Base
# Relationships
  has_a :registry
  belongs_to :user


end
