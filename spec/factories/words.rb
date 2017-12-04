FactoryBot.define do
  factory :word do
    word "MyString"
    
    factory :word_with_definitions do
      after(:create) do |word|
        create(:definition, word: word)
      end
    end
  end
end
