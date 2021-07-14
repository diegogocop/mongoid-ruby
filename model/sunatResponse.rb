class SunatResponse
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  store_in collection: 'sunatResponse'

  field :trackingNumber, as: :trackingNumber, type: String
  field :code, as: :code, type: String
  field :description, as: :description, type: String

end