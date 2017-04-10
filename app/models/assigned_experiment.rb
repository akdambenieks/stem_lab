class AssignedExperiment < ApplicationRecord
  belongs_to :classroom
  belongs_to :experiment

  validates :classroom, uniqueness: {scope: :experiment}

end
