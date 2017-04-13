class Experiment < ApplicationRecord
  belongs_to :user
  has_many :assigned_experiments, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :materials, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings, source: :tag
  has_many :plots, dependent: :destroy


  mount_uploader :image, ImageUploader

  before_create :set_approved_to_false

  def bookmarked_by?(user)
    bookmarks.exists?(user: user)
  end

  def bookmark_for(user)
    bookmarks.find_by(user: user)
  end

  def assigned_to?(classroom)
    assigned_experiments.exists?(classroom: classroom)
  end

  def assignment_for(classroom)
    assigned_experiments.find_by(classroom: classroom)
  end

  private

  def set_approved_to_false
    self.approved = false
  end
end
