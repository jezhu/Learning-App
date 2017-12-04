class Word < ApplicationRecord
  before_save { word.downcase! }
  has_many :definitions, dependent: :destroy
  
  validates :word, presence: true, uniqueness: { case_sensitive: false }
end
