# Factory with Faker
FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    author { Faker::Book.author }
    page_count { rand(100..500) }
    published_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
  end
end

# Factory without Faker
# FactoryBot.define do
 #  factory :book do
 #    title { "MyString" }
 #    description { "MyString" }
 #    author { "MyString" }
#     page_count { 1 }
#     published_at { "2024-05-11" }
 #   end
# end