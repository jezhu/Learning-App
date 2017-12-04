require 'rails_helper'

describe Definition do
  let(:word) { FactoryBot.create(:word) }
  subject { described_class.new(word_id: word.id, content: "to have meaning") }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without word" do
    subject.word_id = nil
    expect(subject).to_not be_valid
  end
  
  describe "Associations" do
    it "has one word" do
      assc = described_class.reflect_on_association(:word)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
