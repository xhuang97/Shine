FactoryGirl.define do
  factory :organization do
   name "Shine Symphony"
   for_profit false
   is_active true
   industry 'Technology'
   association :user
  end

  factory :address do
    street_2 ""
    street_1 "5000 Forbes Avenue"
    city "Pittsburgh"
    state "PA"
    zipcode "15213"
    association :organization
  end


  factory :user do
    first_name "Alex"
    last_name "Bainbridge"
    email "abainbri@andrew.cmu.edu"
    phone 8003213176
    role "admin"
    username "abainbri"
    password "abcd"
    password_confirmation "abcd"
  end

  factory :registry do
    association :organization
    tilte "My Registry"
    description "My Description"
    is_active true
  end

  factory :order do
    date_ordered Date.current
    association :user
    grand_total 2.00
  end

  factory :order_item do
    association :order
    item_name "woman e14p keychain"
    quantity 1
  end

end
