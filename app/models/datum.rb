class Datum < ApplicationRecord
  belongs_to :experiment
  belongs_to :classroom
end
