
class Document
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  store_in collection: 'document'

  field :number, as: :number, type: Integer
  field :serial, as: :serial, type: String
  field :code, as: :code, type: String

end