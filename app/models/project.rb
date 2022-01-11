class Project < ApplicationRecord
  has_many :projects_mortgagors
  has_many :mortgagors, through: :projects_mortgagors
  has_many :documents

  accepts_nested_attributes_for :mortgagors
  validates :project_kind, presence: true

  enum project_kind: { achat: 0, rachat: 1 }
end
