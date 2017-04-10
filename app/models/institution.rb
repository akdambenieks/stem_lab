class Institution < ApplicationRecord

  has_many :users
  has_many :classrooms, dependent: :destroy

  # VALIDATIONS
  validates :name, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :contact_phone, presence: true

end
