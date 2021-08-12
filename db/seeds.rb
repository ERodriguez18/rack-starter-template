Airline.destroy_all


Airline.create([
    { 
      name: "United Airlines",
      image_url: "https://open-flights.s3.amazonaws.com/United-Airlines.png"
    }, 
    { 
      name: "Southwest",
      image_url: "https://open-flights.s3.amazonaws.com/Southwest-Airlines.png"
    },
    { 
      name: "Delta",
      image_url: "https://open-flights.s3.amazonaws.com/Delta.png" 
    }, 
    { 
      name: "Alaska Airlines",
      image_url: "https://open-flights.s3.amazonaws.com/Alaska-Airlines.png" 
    }, 
    { 
      name: "JetBlue",
      image_url: "https://open-flights.s3.amazonaws.com/JetBlue.png" 
    }, 
    { 
      name: "American Airlines",
      image_url: "https://open-flights.s3.amazonaws.com/American-Airlines.png" 
    }
  ])
  


  puts 'Airlines Seeded'

  puts 'Seeding Complete'


  Review.destroy_all

  airline = Airline.all

  review_scores = ['1', '2', '3', '4', '5']

  5.times do 
    Review.create(name: Faker::Name.first_name, title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, score: review_scores.sample)
  end 

  puts 'Reviews seeded'

  puts 'Seeding complete'
