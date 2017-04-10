class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :experiment

  validates :user, uniqueness: {scope: :experiment}
  
end
