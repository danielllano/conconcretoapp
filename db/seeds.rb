# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# PROYECTOS
[{
    name: "Montebianco",
    page_url: "http://montebianco.com.co/"
  }
].each do |project|
  Project.create(project) unless Project.exists?(name: project[:name])
end


# PRODUCTOS
[{
    name: "Colchon 1.40 COUNTRY",
    description: "Comodo colchon semidoble",
    points: "100",
    available_qty: "5"
  },
  {
    name: "Colchon 1.40 URBAN",
    description: "Comodo colchon doble ideal para la habitacion principal de su apartacho",
    points: "115",
    available_qty: "3"
  },
  {
    name: "Mesa Odesa",
    description: "Mesa para exteriores resistente al sol y al agua en acero inoxidable",
    points: "85",
    available_qty: "4"
  },
  {
    name: "Ropero Ferrara",
    description: "Mueble con gran capacidad. Ideal como closet externo o para guardar tus sabanas y toallas",
    points: "95",
    available_qty: "2"
  },
  {
    name: "Equipo de sonido",
    description: "Poderos equipo de sonido con 1200W de salida como para despelucar a los vecinos!",
    points: "70",
    available_qty: "3"
  },
  {
    name: "Lampara dorada",
    description: "Elegante lampara dorada perfecta para mesas de noche, escritorios, estudios o lo que sea. Bajo consumo",
    points: "70",
    available_qty: "3"
  },
  {
    name: "Colchon 1.40 COUNTRY 2",
    description: "Comodo colchon semidoble",
    points: "100",
    available_qty: "5"
  },
  {
    name: "Colchon 1.40 URBAN 2",
    description: "Comodo colchon doble ideal para la habitacion principal de su apartacho",
    points: "115",
    available_qty: "3"
  },
  {
    name: "Mesa Odesa 2",
    description: "Mesa para exteriores resistente al sol y al agua en acero inoxidable",
    points: "85",
    available_qty: "4"
  },
  {
    name: "Ropero Ferrara 2",
    description: "Mueble con gran capacidad. Ideal como closet externo o para guardar tus sabanas y toallas",
    points: "95",
    available_qty: "2"
  },
  {
    name: "Equipo de sonido 2",
    description: "Poderos equipo de sonido con 1200W de salida como para despelucar a los vecinos!",
    points: "70",
    available_qty: "3"
  },
  {
    name: "Lampara dorada 2",
    description: "Elegante lampara dorada perfecta para mesas de noche, escritorios, estudios o lo que sea. Bajo consumo",
    points: "70",
    available_qty: "3"
  },
  {
    name: "Colchon 1.40 COUNTRY 3",
    description: "Comodo colchon semidoble",
    points: "100",
    available_qty: "5"
  },
  {
    name: "Colchon 1.40 URBAN 3",
    description: "Comodo colchon doble ideal para la habitacion principal de su apartacho",
    points: "115",
    available_qty: "3"
  },
  {
    name: "Mesa Odesa 3",
    description: "Mesa para exteriores resistente al sol y al agua en acero inoxidable",
    points: "85",
    available_qty: "4"
  },
  {
    name: "Ropero Ferrara 3",
    description: "Mueble con gran capacidad. Ideal como closet externo o para guardar tus sabanas y toallas",
    points: "95",
    available_qty: "2"
  },
  {
    name: "Equipo de sonido 3",
    description: "Poderos equipo de sonido con 1200W de salida como para despelucar a los vecinos!",
    points: "70",
    available_qty: "3"
  },
  {
    name: "Lampara dorada 3",
    description: "Elegante lampara dorada perfecta para mesas de noche, escritorios, estudios o lo que sea. Bajo consumo",
    points: "70",
    available_qty: "3"
  }
].each do |product|
  Product.create(product) unless Product.exists?(name: product[:name])
end


# PARAMETROS
[{
    key: "pronto pago",
    value: "100",
    unit: "puntos"
  },
  {
    key: "redes sociales",
    value: "5",
    unit: "puntos"
  },
  {
    key: "referido",
    value: "50",
    unit: "puntos"
  }
].each do |parameter|
  Parameter.create(parameter) unless Parameter.exists?(key: parameter[:key])
end

