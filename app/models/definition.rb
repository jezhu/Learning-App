class Definition < ApplicationRecord
  belongs_to :word
  validates_presence_of :word_id
  validates_presence_of :content
end
