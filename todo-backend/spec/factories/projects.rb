require 'faker'

FactoryBot.define do
  factory :project do
    name { Faker::Name.name }
  end
end