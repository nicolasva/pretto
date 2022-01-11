class ProjectDecorator  < Draper::Decorator
  delegate_all
  
  def purcent
    documents_finding = mandatory_documents.select { |document_type, document_count|
      project.documents.where(document: document_type, status: 'validé').count >= document_count
    }

    purcent_progress = mandatory_documents.length.zero? ? 0 : ((documents_finding.length / mandatory_documents.length.to_f) * 100).to_i

    "#{documents_finding.length}/#{mandatory_documents.length} (#{purcent_progress}%)"
  end

  private
  def mandatory_documents
    h = { cni: 0,
          livret_famille: 0,
          bulletins_salaire: 0,
          avis_impots: 0,
          offre_pret: 0,
          tableau_amortissement: 0,
          estimation_bien: 0,
          compromis_vente: 0
        }

    self.object.mortgagors.each do |mortgagor|
      h[:cni] += 1
      h[:avis_impots] += mortgagor.contract == "salarié" ? 3 : 5
      h[:bulletins_salaire] += 3 if mortgagor.contract == "salarié"
      h[:livret_famille] += 1 if mortgagor.civil_status == "marie"
    end

    h[:compromis_vente] += 1 if self.object.project_kind == "achat"
    h[:tableau_amortissement] += 1 if self.object.project_kind == "achat"
    h[:offre_pret] += 1 if self.object.project_kind == "rachat"
    h[:estimation_bien] += 2 if self.object.project_kind == "rachat"
    h.select { |_, v| v > 0 }
  end
end