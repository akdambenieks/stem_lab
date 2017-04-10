class Classroom < ApplicationRecord
  belongs_to :user
  belongs_to :institution
  has_many :assigned_experiments, dependent: :destroy
  has_many :experiments, through: :assigned_experiments
  has_many :data, dependent: :nullify

  has_secure_password

  # VALIDATIONS
  validates :code_name, presence: true, uniqueness: true
  validates :password_digest, presence: true

end
