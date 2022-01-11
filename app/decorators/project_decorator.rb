class ProjectDecorator < Draper::Decorator
  delegate_all
  
  def purcent
    documents_finding = mandatory_documents.select do |document_type, document_count|
      project.documents.where(document: document_type, status: 'validé').count >= document_count
    end

    purcent_progress = 0
    unless mandatory_documents.empty?
      purcent_progress = progress(documents_finding.length, mandatory_documents.length)
    end
      
    "#{documents_finding.length}/#{mandatory_documents.length} (#{purcent_progress}%)"
  end

  private

  def mandatory_documents
    docs = mandatory_mortgagors

    docs[:compromis_vente] += 1 if self.object.project_kind == 'achat'
    docs[:tableau_amortissement] += 1 if self.object.project_kind == 'achat'
    docs[:offre_pret] += 1 if self.object.project_kind == 'rachat'
    docs[:estimation_bien] += 2 if self.object.project_kind == 'rachat'
    docs.select { |_, v| v > 0 }
  end

  def progress(documents_finding_length, mandatory_documents_length)
    ((documents_finding_length / mandatory_documents_length.to_f) * 100).to_i
  end

  def init_hash_docs
    { cni: 0,
      livret_famille: 0,
      bulletins_salaire: 0,
      avis_impots: 0,
      offre_pret: 0,
      tableau_amortissement: 0,
      estimation_bien: 0,
      compromis_vente: 0
    }
  end

  def mandatory_mortgagors
    docs = init_hash_docs
    object.mortgagors.each do |mortgagor|
      docs[:cni] += 1
      docs[:avis_impots] += mortgagor.contract == 'salarié' ? 3 : 5
      docs[:bulletins_salaire] += 3 if mortgagor.contract == 'salarié'
      docs[:livret_famille] += 1 if mortgagor.civil_status == 'marie'
    end
    return docs
  end
end
