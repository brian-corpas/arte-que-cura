# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Product.destroy_all
Tag.destroy_all

puts 'Creating seeds'

Tag.create(name: "Saboaria")
Tag.create(name: "Sólidos")
Tag.create(name: "Cosmética Facial")
Tag.create(name: "Corpo")

product = Product.create(
  name: 'Hidratante Corporal em Barra',
  description: 'Óleo de côco bio; Manteiga de karité bio; Óleo de baobab; Cera candelila; OE (benjoim; salva esclareia; vetiver; sândalo amyris; ylang ylang)',
  price_cents: 1500
  )
file = URI.open("https://res.cloudinary.com/dmer5xpee/image/upload/v1602070327/ArteQueCura/hidratante_corporal_uengze.jpg")
product.photo.attach(io: file, filename: 'product.jpg', content_type: 'image/jpg')

product = Product.create(
  name: 'Bálsamo Labial Frutos Silvestres',
  description: 'Óleo de avelâ; Manteiga de cacau; Manteiga de karité; Cera candelina; Vitamina E; Aroma de frutos silvestres',
  price_cents: 1200
  )
file = URI.open("https://res.cloudinary.com/dmer5xpee/image/upload/v1602070327/ArteQueCura/balsamo_labial_frutos_silvestres_ga5jeo.jpg")
product.photo.attach(io: file, filename: 'product.jpg', content_type: 'image/jpg')

product =Product.create(
  name: 'Bálsamo Labial de Avelã',
  description: 'Óleo de avelã; Manteiga de cacau; Manteiga de karité; Cera candelina; Vitamina E; OE: peppermint',
  price_cents: 1200
  )
file = URI.open("https://res.cloudinary.com/dmer5xpee/image/upload/v1602070327/ArteQueCura/balsamo_labial_frutos_silvestres_ga5jeo.jpg")
product.photo.attach(io: file, filename: 'product.jpg', content_type: 'image/jpg')


product = Product.create(
  name: 'Shampoo Sólido de Azeite e Flores de Laranjeira',
  description: 'Flores de laranjeira maceradas em azeite; Manteigade karité; Óleo de avelã; Óleo de côco bio; Óleo de jojoba; OE (lavandim, cedro do atlas, peppermint); Argila verde',
  price_cents: 1700
  )
file = URI.open("https://res.cloudinary.com/dmer5xpee/image/upload/v1602070327/ArteQueCura/Shampoo_Solido_de_Azeite_e_Flores_de_Laranjeira_qc3gjp.jpg")
product.photo.attach(io: file, filename: 'product.jpg', content_type: 'image/jpg')

product = Product.create(
  name: 'Creme Desodorizante',
  description: 'Óleo de côco; Manteiga de karité; Cera de soja; Vitamina E; OE (lavandim, árvore do chá, tomilho, salva); Bicarbonato de sódio; Amido de milho',
  price_cents: 1500
  )
file = URI.open("https://res.cloudinary.com/dmer5xpee/image/upload/v1602070327/ArteQueCura/creme_desodorizante_hyswo6.jpg")
product.photo.attach(io: file, filename: 'product.jpg', content_type: 'image/jpg')

puts 'Seeds created'
