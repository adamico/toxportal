#encoding: utf-8
class Dossier
  include Mongoid::Document

  ## Fields
  field :code,                          type: String, null: false
  field :date_deces,                    type: Date
  field :age,                           type: Integer
  field :sexe,                          type: String
  field :bmi,                           type: Integer
  field :taille,                        type: String
  field :decouverte_corps,              type: Integer
  field :decouverte_corps_autre,        type: String
  field :intervention_medicale,         type: Integer
  field :intervention_medicale_autre,   type: String
  field :hospitalisation,               type: Integer
  field :profession,                    type: Integer
  field :profession_libelle,            type: String
  field :situation_familiale,           type: Integer
  field :antecedents,                   type: Integer
  field :antecedents_details,           type: String
  field :traitement,                    type: Integer
  field :traitement_details,            type: String
  field :antecedents_psy,               type: Integer
  field :antecedents_psy_suivi,         type: Boolean
  field :antecedents_psy_dep,           type: Boolean
  field :antecedents_psy_psychose,      type: Boolean
  field :antecedents_psy_ts,            type: Boolean
  field :antecedents_psy_ts_mode,       type: String
  field :substances_proximite,          type: Integer
  field :substances_proximite_details,  type: String
  field :dependance,                    type: Integer
  %w(alcool tabac opiaces cannabis autre).each do |dep|
    field "dependance_#{dep}",          type: Boolean
    field "sevrage_#{dep}",             type: Integer
  end
  field :dependance_autre_libelle,      type: String
  field :toxicologue,                   type: String
  field :prelevements,                  type: Array
  field :prelevements_autres,           type: Boolean
  field :prelevements_autres_libelle,   type: String
  field :analyses,                      type: Array
  field :analyses_autres,               type: Boolean
  field :analyses_autres_libelle,       type: String

  ## Constants
  SEXE = ["M", "F"]
  BMI = [["< 18", 0], ["18 < BMI < 24", 1], ["> 24", 2]]
  DECOUVERTECORPS = [["Voie publique", 0], ["Domicile", 1], ["Prison", 2], ["Hôpital", 3], ["Milieu festif", 4], ["Autre", 5]]
  NONOUI = [["Non",0], ["Oui", 1]]
  NPNONOUI = [["Non précisé", 0], ["Non", 1], ["Oui", 2]]
  SEVRAGE = [["Non précise", 0], ["Non", 1], ["Patient naïf", 2], ["Oui, en cours", 3]]

  ## Validations
  validates_presence_of :code
  validates_uniqueness_of :code

  ## Mass assignment protection
  attr_accessible :code, :date_deces, :departement_id, :age, :sexe, :taille, :decouverte_corps_autre, :intervention_medicale_autre, :profession_libelle, :antecedents_details, :antecedents_psy_suivi, :antecedents_psy_dep, :antecedents_psy_psychose, :antecedents_psy_ts, :antecedents_psy_ts_mode, :traitement_details, :substances_proximite_details, :dependance_alcool, :dependance_tabac, :depependance_opiaces, :dependance_cannabis, :dependance_autre, :dependance_autre_libelle, :toxicologue, :prelevements, :analyses, :prelevements_autres, :prelevements_autres_libelle, :analyses_autres, :analyses_autres_libelle

  ## relations
  belongs_to :departement
  has_many :dosages, dependent: :destroy
  accepts_nested_attributes_for :dosages, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
