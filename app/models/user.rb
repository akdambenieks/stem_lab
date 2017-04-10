class User < ApplicationRecord
  belongs_to :institution
  has_many :classrooms, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_experiments, through: :bookmarks, source: :experiment

  has_secure_password

  # VALIDATIONS
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :institution_id, presence: true

  # CALLBACKS
  before_save :downcase_email
  before_create :generate_confirmation_instructions

  # CALLBACK METHODS
  def downcase_email
    self.email = self.email.downcase
  end

  # This method generates a confirmation token and sets the time that the token was sent in the users table of the db
  # This token is sent to the user so that they can confirm their email
  def generate_confirmation_instructions
    self.confirmation_token = SecureRandom.hex(10)
    self.confirmation_sent_at = Time.now
    self.approved = false
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def confirmation_token_valid?
    (self.confirmation_sent_at.to_time + 14.days) > Time.now
  end

  def confirm_user!
    self.confirmation_token = nil
    self.confirmed_at = Time.now
    save
  end

  def is_admin?
    self.role == 'admin'
  end

end
