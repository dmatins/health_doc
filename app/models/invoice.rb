class Invoice < ApplicationRecord
  belongs_to :patient
  has_many :records

  has_paper_trail
end
