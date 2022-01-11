class Mortgagor < ApplicationRecord
  has_many :projects_mortgagors
  has_many :projects, through: :projects_mortgagors
  
  validates :first_name, presence: true
  validates :contract, presence: true
  validates :civil_status, presence: true

  enum contract: { avocat: 1, salarié: 2 }
  enum civil_status: { autre: 0, marie: 1, marrie_sans_contrat: 2 }
end