# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

projects = [
  {
    id: 1,
    mortgagors: [
      { id: 1, first_name: 'Mélanie', contract: 'avocat', civil_status: 'marrie_sans_contrat' },
      { id: 2, first_name: 'Bertrand', contract: 'salarié', civil_status: 'marrie_sans_contrat' }
    ],
    project_kind: 'achat'
  },

  { mortgagors: [{ id: 3, first_name: 'Jeanne', contract: 'salarié' }], project_kind: 'rachat' }
]

projects.each do |p|
  #project[:mortgagors].each do |mortgagor|
  #  puts Mortgagor.contracts[mortgagor[:contract]]
  #  mortgagor[:contract] = Mortgagor.contracts[mortgagor[:contract]]
  #  mortgagor[:civil_status] = Mortgagor.civil_statuses[mortgagor[:civil_status]]
  #end
  project = Project.new(project_kind: p[:project_kind])
  #project.mortgagors_attributes = p[:mortgagors]
  project.save

  p[:mortgagors].each do |m|
    mortgagor = Mortgagor.new(m)
    project.mortgagors << mortgagor
  end
end

#create_table "documents", force: :cascade do |t|
#  t.integer "project_id", null: false
#  t.integer "document", default: 0, null: false
#  t.integer "status", default: 0, null: false
#  t.integer "month", null: false
#  t.integer "year", null: false
#  t.datetime "created_at", precision: 6, null: false
#  t.datetime "updated_at", precision: 6, null: false
#  t.index ["project_id"], name: "index_documents_on_project_id"
#end

documents = [
  { id: 1, document: 'cni', project_id: 1, mortgagor_id: 1, status: 'refusé'},
  { id: 2, document: 'cni', project_id: 1, mortgagor_id: 2, status: 'validé'},
  { id: 3, document: 'cni', project_id: 1, mortgagor_id: 1, status: 'validé'},
  { id: 4, document: 'cni', project_id: 2, mortgagor_id: 3, status: 'validé' },
  { id: 5, document: 'livret_famille', project_id: 1, status: 'validé'},
  { id: 6, document: 'bulletins_salaire', project_id: 1, mortgagor_id: 2, status: 'empty', month: 1, year: 2021 },
  { id: 7, document: 'bulletins_salaire', project_id: 1, mortgagor_id: 2, status: 'validé', month: 2, year: 2021 },
  { id: 8, document: 'bulletins_salaire', project_id: 1, mortgagor_id: 2, status: 'validé', month: 3, year: 2021 },
  { id: 9, document: 'avis_impots', project_id: 1, status: 'validé',year: 2020 },
  { id: 10, document: 'avis_impots', project_id: 1, status: 'validé', year: 2019 },
  { id: 11, document: 'avis_impots', project_id: 1, status: 'validé', year: 2018 },
  { id: 12, document: 'avis_impots', project_id: 1, status: 'validé', year: 2017 },
  { id: 13, document: 'avis_impots', project_id: 2, mortgagor_id: 3, status: 'validé', year: 2019 },
  { id: 14, document: 'avis_impots', project_id: 2, mortgagor_id: 3, status: 'validé', year: 2020 },
  { id: 15, document: 'offre_pret', project_id: 2, status: 'validé'},
  { id: 16, document: 'tableau_amortissement', project_id: 2, status: 'validé'},
  { id: 17, document: 'estimation_bien', project_id: 2, status: 'validé'},
  { id: 18, document: 'avis_impots', project_id: 2, mortgagor_id: 3, status: 'validé', year: 2018 }
]

Document.create(documents)