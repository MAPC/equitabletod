# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dictionary_entry do
    name "MyString"
    code "MyString"
    description "MyText"
    importance "MyText"
    interpretation "MyText"
    technical_notes "MyText"
    order 1
  end
end
