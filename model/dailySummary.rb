class SummaryDocuments
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  store_in collection: 'summaryDocuments'

  field :gd, as: :generationDate, type: Time, default: Time.now
  field :rd, as: :receptionDate, type: Time, default: Time.now
  field :sq, as: :sequence, type: String

  embeds_many :documents, class_name: 'Document'


  def to_hash
    hash = {}
    instance_variables.each { |var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
    hash
  end
end