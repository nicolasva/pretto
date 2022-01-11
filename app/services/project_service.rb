class ProjectService
  def self.call(projects)
    new(projects).execute
  end

  def execute
    projects.each do |project|
      mandatory_documents = mandatory_documents(project)
      documents_finding = mandatory_documents.select { |document_type, document_count|
        project.documents.where(document: document_type, status: 'validé').count >= document_count
      }

      purcent_progress = mandatory_documents.length.zero? ? 0 : ((documents_finding.length / mandatory_documents.length.to_f) * 100).to_i

      project_with_purcentage << { id: project.id, project_kind: project.project_kind, purcent: "#{documents_finding.length}/#{mandatory_documents.length} (#{purcent_progress}%)" }
    end

    return project_with_purcentage
  end

  private
  attr_reader :projects
  attr_accessor :project_with_purcentage

  def initialize(projects)
    @project_with_purcentage = Array.new
    @projects = projects
  end

  def mandatory_documents(project)
    h = { cni: 0,
          livret_famille: 0,
          bulletins_salaire: 0,
          avis_impots: 0,
          offre_pret: 0,
          tableau_amortissement: 0,
          estimation_bien: 0,
          compromis_vente: 0
        }

    project.mortgagors.each do |mortgagor|
      h[:cni] += 1
      h[:avis_impots] += mortgagor.contract == "salarié" ? 3 : 5
      h[:bulletins_salaire] += 3 if mortgagor.contract == "salarié"
      h[:livret_famille] += 1 if mortgagor.civil_status == "marie"
    end

    h[:compromis_vente] += 1 if project.project_kind == "achat"
    h[:tableau_amortissement] += 1 if project.project_kind == "achat"
    h[:offre_pret] += 1 if project.project_kind == "rachat"
    h[:estimation_bien] += 2 if project.project_kind == "rachat"

    # documents avec au moins un élément demandé
    h.select { |_, v| v > 0 }
  end
end