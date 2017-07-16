require 'test_helper'

class NewsLetterTest < ActiveSupport::TestCase
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email).case_insensitive
  should allow_value("abainbri@gmail.com").for(:email)
  should allow_value("abainbri@andrew.cmu.edu").for(:email)
  should_not allow_value("afkdljafkads").for(:email)
end
