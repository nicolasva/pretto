class ProjectsMortgagor < ApplicationRecord
  belongs_to :project
  belongs_to :mortgagor

  accepts_nested_attributes_for :project
end