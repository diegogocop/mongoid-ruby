class Cpe
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  store_in collection: 'cpes'
  field :nu, as: :number, type: Integer
  field :sn, as: :serialNumber, type: String
  field :co, as: :code, type: String
  field :ed, as: :emissionDate, type: Time
  field :ic, as: :issuerCode, type: String
  field :in, as: :issuerName, type: String
  field :rt, as: :receiverCodeType, type: String
  field :rc, as: :receiverCode, type: String
  field :rn, as: :receiverName, type: String
  field :cc, as: :currencyCode, type: String
  field :na, as: :netAmount, type: Float
  field :ta, as: :totalAmount, type: Float
  field :rd, as: :receptionDate, type: Time
  field :si, as: :summaryId, type: String
  field :gd, as: :generationDate, type: Time, default: Time.now
  field :vd, as: :voided, type: Boolean, default: false
  field :an, as: :annulled, type: Boolean, default: false
  field :er, as: :exchangeRate, type: Float
  embeds_many :archives, class_name: 'Archive'
  embeds_many :taxes, class_name: 'CpeTax'
  embeds_many :related, class_name: 'Related'
  index({ic: 1, co: 1, nu: 1, sn: 1, ed: 1, rd: 1, gd: 1}, {background: true})
  index({rc: 1, co: 1, nu: 1, sn: 1, ed: 1, rd: 1, gd: 1}, {background: true})

  def to_hash
    hash = {}
    instance_variables.each { |var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
    hash
  end
end