FactoryBot.define do
  factory :task do
    name { "MyString" }
    description { "MyText" }
    project { create(:project) }
  end
end
