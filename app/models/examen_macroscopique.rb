class ExamenMacroscopique
  include Mongoid::Document
  %w(cerebrale cardiaque pulmonaire hepatique renale autre).each do |examen|
    field examen,               :type => Boolean
    field "#{examen}_resultat", :type => String
  end

  embedded_in :dossier
end
