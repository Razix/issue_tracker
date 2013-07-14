FactoryGirl.define do
  factory :admin do
    username "super_admin"
    password "foobar"
    password_confirmation "foobar"
  end
end