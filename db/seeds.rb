# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ADMINS-----------------------------------------------------

admin1 = Admin.create!(email:'jonathan@admin.com', password: 'password' )
admin2 = Admin.create!(email:'larissa@admin.com', password: 'password' )


#Carriers----------------------------------------------------

carrier1 = Carrier.create(brand_name:'Wayne Express', 
                          company_name:'Wayne Enterprises Inc', 
                          email_domain:'wayne.com',
                          company_register:'70.190.836/0001-81', 
                          city:'Rio de Janeiro',
                          state: 'RJ' ,
                          adress:'Avenida Almirante Barroso, 81',
                          status:1)

carrier2 = Carrier.create!(brand_name:'LexCorp', 
    company_name:'LexCorp Incorporated', 
    email_domain:'lexcorp.com',
    company_register:'85.732.736/0001-07', 
    city:'Goiânia',
    state: 'GO' ,
    adress:'Av. Portugal, 1148',
    status:1)

carrier3 = Carrier.create!(company_name:' Stark Logistics Inc', 
      company_register:'00.178.762/0001-82',
      brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
      city:'Tatuapé', state:'SP', 
      email_domain:'stark.com', status: 1)

carrier4 = Carrier.create!(brand_name:'Correios', 
        company_name:'Correios do Brasil', 
        email_domain:'correios.com',
        company_register:'02.284.551/0001-50', 
        city:'Brasília',
        state: 'DF' ,
        adress:'Edifício Sede dos Correios',
        status:1)

carrier5 = Carrier.create!(brand_name:'Ruby Delivery', 
          company_name:'Ruby nos trilhos SA', 
          email_domain:'onrails.com',
          company_register:'03.274.321/0001-26', 
          city:'Santo André',
          state: 'SP' ,
          adress:'Av Industrial, 600',
          status:1)

#USERS-------------------------------------------------------

user1 = User.create!(email: 'bruce@wayne.com', password:'password', carrier:carrier1)
user2 = User.create!(email: 'luthor@lexcorp.com', password:'password', carrier:carrier2)
user3 = User.create!(email: 'tony@stark.com', password:'password', carrier: carrier3)
user4 = User.create!(email:'robson@correios.com', password: 'password', carrier:carrier4 )
user5 = User.create!(email:'joao@onrails.com', password: 'password', carrier:carrier5 )

#Vehicles----------------------------------------------------
  #carrier1
    vehicle1 = Vehicle.create!(lincese_plate:'MYB-6881', 
                                brand:'Ford',
                                model:'C-1419',
                                year:2016,
                                weight_capacity:1500,
                                carrier:carrier1)

    vehicle2 = Vehicle.create!(lincese_plate:'KCS-8503', 
                                brand:'Mercedes-Benz',
                                model:'Accelo 915',
                                year:2004,
                                weight_capacity:4000,
                                carrier:carrier1)


  #Carrier2
    vehicle3 = Vehicle.create!(lincese_plate:'MYV-7815', 
                                brand:'Shineray',
                                model:'SY6390',
                                year:2012,
                                weight_capacity:900,
                                carrier:carrier2)

    vehicle4 = Vehicle.create!(lincese_plate:'IDB-9007', 
                                brand:'Mercedes-Benz',
                                model:'S-500L',
                                year:2014,
                                weight_capacity:1250,
                                carrier:carrier2)


  #Carrier3
    vehicle5 = Vehicle.create!(lincese_plate:'KDC-6231', 
                                brand:'CHANA',
                                model:'Perua',
                                year:2005,
                                weight_capacity:3100,
                                carrier:carrier3)

    vehicle6 = Vehicle.create!(lincese_plate:'IAZ-1585', 
                                brand:'Peugeot',
                                model:'206',
                                year:2006,
                                weight_capacity:800,
                                carrier:carrier3)


  #Carrier4
    vehicle7 = Vehicle.create!(lincese_plate:'LVT-6974', 
                                brand:'Asia',
                                model:'Towner',
                                year:1997,
                                weight_capacity:1300,
                                carrier:carrier4)

    vehicle8 = Vehicle.create!(lincese_plate:'HPK-9327', 
                                brand:'Fiat',
                                model:'Strada',
                                year:2008,
                                weight_capacity:2200,
                                carrier:carrier4)


  #Carrier5
    vehicle9 = Vehicle.create!(lincese_plate:'KJH-5697', 
                                brand:'Hyundai',
                                model:'Hillux',
                                year:1997,
                                weight_capacity:3500,
                                carrier:carrier5)

    vehicle10 = Vehicle.create!(lincese_plate:'KMX-1192', 
                                brand:'Renault',
                                model:'Sandero',
                                year:2017,
                                weight_capacity:1000,
                                carrier:carrier5)

#Prices & Deadlines ----------------------------------------------------
  #Carrier1
    price1 = Price.create!(size_min:0.1, size_max:0.5,
                  weight_min:0.1, weight_max:5,
                  km_value:0.65,carrier:carrier1)
    price2 = Price.create!(size_min:0.51, size_max:1.0,
                  weight_min:5, weight_max:10,
                  km_value:1.35,carrier:carrier1)
    price3 = Price.create!(size_min:1.51, size_max:2.0,
                  weight_min:10, weight_max:20,
                  km_value:3.00,carrier:carrier1)
    deadline1 = Deadline.create!(km_min:0, km_max:70, km_time:2, carrier:carrier1)
    deadline2 = Deadline.create!(km_min:70, km_max:200, km_time:5, carrier:carrier1)
    deadline3 = Deadline.create!(km_min:200, km_max:500, km_time:10, carrier:carrier1)

  #Carrier2
    price4 = Price.create!(size_min:0.1, size_max:0.5,
                  weight_min:0.1, weight_max:50,
                  km_value:2.65,carrier:carrier2)
    price5 = Price.create!(size_min:0.51, size_max:1.5,
                  weight_min:0.1, weight_max:50,
                  km_value:3.25,carrier:carrier2)
    price6 = Price.create!(size_min:1.51, size_max:2.0,
                  weight_min:0, weight_max:150,
                  km_value:4.65,carrier:carrier2)
    deadline4 = Deadline.create!(km_min:0, km_max:100, km_time:4, carrier:carrier2)
    deadline5 = Deadline.create!(km_min:100, km_max:300, km_time:8, carrier:carrier2)
    deadline6 = Deadline.create!(km_min:300, km_max:800, km_time:15, carrier:carrier2)

  #Carrier3
    price7 = Price.create!(size_min:0.01, size_max:0.25,
                  weight_min:0.1, weight_max:5,
                  km_value:0.20,carrier:carrier3)
    price8 = Price.create!(size_min:0.26, size_max:0.50,
                  weight_min:5.1, weight_max:10,
                  km_value:0.75,carrier:carrier3)
    price9 = Price.create!(size_min:0.51, size_max:0.75,
                  weight_min:10.1, weight_max:15,
                  km_value:1.40,carrier:carrier3)
    deadline7 = Deadline.create!(km_min:0, km_max:100, km_time:1, carrier:carrier3)
    deadline8 = Deadline.create!(km_min:101, km_max:200, km_time:2, carrier:carrier3)
    deadline9 = Deadline.create!(km_min:201, km_max:300, km_time:3, carrier:carrier3)

  #Carrier4
    price10 = Price.create!(size_min:0.1, size_max:0.65,
                  weight_min:0.1, weight_max:50,
                  km_value:0.65,carrier:carrier4)
    price11 = Price.create!(size_min:0.66, size_max:1,
                  weight_min:50.1, weight_max:100,
                  km_value:1.55,carrier:carrier4)
    price12 = Price.create!(size_min:0.1, size_max:1.5,
                  weight_min:20.1, weight_max:150,
                  km_value:3.28,carrier:carrier4)
    deadline10 = Deadline.create!(km_min:0, km_max:150, km_time:3, carrier:carrier4)
    deadline11 = Deadline.create!(km_min:151, km_max:300, km_time:7, carrier:carrier4)
    deadline12 = Deadline.create!(km_min:301, km_max:500, km_time:12, carrier:carrier4)

  #Carrier5
    price13 = Price.create!(size_min:0.1, size_max:0.5,
                  weight_min:0.1, weight_max:24.9,
                  km_value:0.95,carrier:carrier5)
    price14 = Price.create!(size_min:0.51, size_max:1.0,
                  weight_min:25, weight_max:50,
                  km_value:1.25,carrier:carrier5)
    price15 = Price.create!(size_min:1.0, size_max:2.5,
                  weight_min:50.1, weight_max:120,
                  km_value:2.05,carrier:carrier5)
    deadline13 = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier5)
    deadline14 = Deadline.create!(km_min:81, km_max:160, km_time:3, carrier:carrier5)
    deadline15 = Deadline.create!(km_min:161, km_max:240, km_time:5, carrier:carrier5)

#Orders e Updates -------------------------------------------------------------------
  order1 = Order.create!(customar_name:'Douglas',customer_adress:'Rua dos condomínios, Santo André - SP',
                          derparture_adress:'Paço municial, santo andré - SP',
                          distance:12,
                          product_number:'N0T3B00K-G4M3R', size:0.8, weight:4 ,
                          carrier:carrier1, vehicle:vehicle1, status: 30)

  order1_delivery_update1 = DeliveryUpdate.create!(order: order1, coord_position:'CDD Santo André' ,delivery_description: 'Objeto chegou ao centro de destribuição' )
  order1_delivery_update2 = DeliveryUpdate.create!(order: order1, coord_position:'CDD Santo André' ,delivery_description: 'Em trânsito' )
  order1_delivery_update3 = DeliveryUpdate.create!(order: order1, coord_position:'CDD Santo André' ,delivery_description: 'Objeto em tránsito para destinatário' )

  order2 = Order.create!(customar_name:'Gabriel',customer_adress:'Rua da praia, Praia Grande - SP',
    derparture_adress:'Rua do Galpão, Diadema - SP',
    distance:75,
    product_number:'GU4RD4-S0L', size:0.25, weight:2 ,
    carrier:carrier2, vehicle:vehicle3, status: 20)

  order2_delivery_update1 = DeliveryUpdate.create!(order: order2, coord_position:'CDD Diadema' ,delivery_description: 'Em processamento' )

  order3 = Order.create!(customar_name:'Joana',customer_adress:'Rua do centro, Belo Horizon - MG',
    derparture_adress:'Rua do Armazém, Niterói - RJ',
    distance:440,
    product_number:'S3GR3D0-S3CR3T0', size:1.37, weight:133 ,
    carrier:carrier4, vehicle:vehicle8, status: 20)