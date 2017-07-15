class NewsLetter < ActiveRecord::Base

# Relationships

# Scopes

# Validations
  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format" }

# Callbacks

# Other methods
end
