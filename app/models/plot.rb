class Plot < ApplicationRecord
  belongs_to :experiment
  has_many :scatter_data_sets
end
