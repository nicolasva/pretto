class Document < ApplicationRecord
  belongs_to :project
  belongs_to :mortgagor, optional: true

  validates :document, presence: true
  validates :status, presence: true

  enum document: { cni: 0, livret_famille: 1, bulletins_salaire: 2, avis_impots: 3, offre_pret: 4, tableau_amortissement: 5, estimation_bien: 6 }
  enum status: { refusé: 0, empty: 1, validé: 2 }
end