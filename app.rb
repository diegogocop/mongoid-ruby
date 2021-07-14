require 'mongoid'
# require 'active_record'

Mongoid.load!("mongo.yml", :development)

require File.expand_path('../model/company.rb', __FILE__)
require File.expand_path('../model/document.rb', __FILE__)
require File.expand_path('../model/dailySummary.rb', __FILE__)
require File.expand_path('../model/cpe.rb', __FILE__)

# Ejecicio 1: Contar resúmenes con respuesta correcta de Sunat : sunatResponse: { code: 0 }
# total = SummaryDocuments.where('sunatResponse.code': '0').count
# puts total

# Ejercicio 2: Buscar resúmenes erróneos entre fechas noviembre 2018 : rd (reception date) codigo de respuesta de la sunat = 0
# res = SummaryDocuments.where(:receptionDate.gte => "2018-11-01", :receptionDate.lte => "2018-11-30", :"sunatResponse.code".ne => "0")
# puts "no hay registros" if res.blank?
# puts res


# Ejercicio 3: Buscar resúmenes donde tengan nota de crédito o débito : documents.code
# res = SummaryDocuments.in("documents.code": ["07", "08"])
# res = SummaryDocuments.in("documents.code": ["07", "08"]).count
# puts res

#Ejercicio 4: Buscar cpes con codigo empresa 20602556272 superiores a 50 soles : ic (codigo empresa) y ta (total amount)
# cod_company = "20602556272"
# cpes = Cpe.where( issuerCode: cod_company, :totalAmount.gt => 50)
# puts cpes.map(&:to_hash)


#Ejercicio 5: Buscar la última boleta generada : gd (generation date)
# cpe = Cpe.order(generationDate: -1).limit(1)
# puts cpe
# puts cpe.map(&:to_hash)

# # Ejercicio 6: Contar cuantas empresas hay generadas entre 01-07-2018 y 30-07-2018 : gd (generation date)
# companies = Company.where(:generationDate.gte => "01-07-2018", :generationDate.lte => "30-07-2018")
# puts companies.map(&:to_hash)


# +++++++++++++++++++++++++++++++++++++++++++++++++++++++
# -- Querys Mongo usando aggregate (Investigar) --

# db.orders.aggregate([
#    { $match: { status: "A" } },
#    { $group: { _id: "$cust_id", total: { $sum: "$amount" } } }
# ])
# Calcula y procesa datos que devuelven resultados agrupados
# Agrupa datos de carios documentos y opera de muchas maneras dentro 
# de estos.
# Al llamar el metodo aggregate a una coleccion pasamos por 4 fases;
# Es una TUBERIA por la cual canaliza y filtra data => Mensaje para el diego del futuro

# $project => $match => $group => $sort
# aggregate_company = SummaryDocuments.collection.aggregate([
#       { '$match' =>  { sunatResponse: { '$exists': false } } },
#       { '$count' => "count"},
#     ])
# puts aggregate_company.to_a[0]["count"]

# TODO:
# aggregate_cpes = Cpe.collection.aggregate([
#   {
#     '$match' => {
#       sn:  /^F/,
#       gd: {
#         '$gte' => Date.parse("2019-01-01"), 
#         '$lte' => Date.parse("2019-01-31")
#       }
#     }
#   },
#   {
#     '$count' => "contador"
#   }
# ])
# puts "++++++"
# puts aggregate_cpes.to_a

