
class Company
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  store_in collection: 'companies'

  field :ci, as: :cpnId, type: Integer
  field :cc, as: :cpnCode, type: String
  field :su, as: :sunatUser, type: String
  field :sp, as: :sunatPass, type: String
  field :ce, as: :certificateId, type: String
  field :ia, as: :isActive, type: Boolean, default: true
  field :ip, as: :inProduction, type: Boolean, default: false
  field :gd, as: :generationDate, type: Time, default: Time.now

  index({ci: 1, cc: 1, ia: 1}, {background: true})

  def to_hash
    hash = {}
    instance_variables.each { |var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
    hash
  end
end