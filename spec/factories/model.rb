FactoryBot.define do
  
  factory :user_test, class: 'User' do
    id {1}
    name {"たなか"}
    email {"xxx@example.com"}
    password {"123456"}
  end
  
  factory :travel, class: 'Tavel' do
    title { "xxxxxxxxxxxxxxxxxxxxxxxxxxxx" }
    date {"2021/02/02"}
  end
  
  factory :travel_plan, class: 'TravelPlan' do
    text { "xxxxxxxxxx" }
  end
  
  factory :gallery, class: 'Gallery' do
    id {1}
    user_id {1}
    travel_id {1}
    public_status {"true"}
    text {"xxxxxxxxxxxxxxxxxxxxxxxxxxxx"}
    address {"東京"}
  end
  
    
    
end