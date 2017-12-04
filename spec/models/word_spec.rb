require 'rails_helper'

describe Word do
  # Saves word unlike subject
  let(:subject) { FactoryBot.create(:word) }
  # subject { described_class.new(word: "example") }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without a word" do
    subject.word = nil
    expect(subject).to_not be_valid
  end
  
  it "is unique" do
    duplicate = subject.dup
    expect(duplicate).to_not be_valid
  end
  
  it "is unique and case insensitive" do
    duplicate = subject.dup
    duplicate.word.upcase!
    expect(duplicate).to_not be_valid
  end
  
  describe "Associations" do
    it "can have multiple definitions" do
      assc = described_class.reflect_on_association(:definitions)
      expect(assc.macro).to eq :has_many
    end
  end
end
