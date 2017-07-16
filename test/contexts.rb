# require needed files
require './test/sets/users'
require './test/sets/organizations'
require './test/sets/addresses'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Users
  include Contexts::Organizations
  include Contexts::Addresses

end