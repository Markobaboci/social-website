require 'faker'  # Faker gem to generate random data
require 'open-uri'

puts "Seeding soziale Anbieter..."

Consultation.delete_all # delete all previous data

# German provider names and random Berlin addresses
providers = [
  { name: "Sozialdienst Berlin Mitte", address: "Alexanderplatz 1, 10178 Berlin" },
  { name: "Familienhilfe Kreuzberg", address: "Kottbusser Damm 5, 10967 Berlin" },
  { name: "Jugendzentrum Friedrichshain", address: "Frankfurter Allee 23, 10247 Berlin" },
  { name: "Seniorenbetreuung Charlottenburg", address: "Kaiserdamm 100, 14057 Berlin" },
  { name: "Kinderschutzbund Pankow", address: "Breite Straße 30, 13187 Berlin" },
  { name: "Frauenhaus Neukölln", address: "Karl-Marx-Straße 75, 12043 Berlin" },
  { name: "Integrationshilfe Spandau", address: "Wilhelmstraße 35, 13593 Berlin" },
  { name: "Tafel Lichtenberg", address: "Herzbergstraße 79, 10365 Berlin" },
  { name: "Obdachlosenhilfe Marzahn", address: "Hellersdorfer Straße 45, 12629 Berlin" },
  { name: "Migrationsberatung Steglitz", address: "Schloßstraße 110, 12163 Berlin" },
  { name: "Kita und Familienzentrum Tempelhof", address: "Tempelhofer Damm 87, 12101 Berlin" },
  { name: "Sozialberatung Treptow", address: "Elsenstraße 3, 12435 Berlin" },
  { name: "Jugendhilfe Reinickendorf", address: "Oraniendamm 68, 13469 Berlin" },
  { name: "Frauenberatung Wedding", address: "Müllerstraße 30, 13353 Berlin" },
  { name: "Gesundheitszentrum Wilmersdorf", address: "Uhlandstraße 95, 10715 Berlin" }
]

15.times do |i|
  provider = providers[i]
  consultation = Consultation.create!(
    name: provider[:name],
    address: provider[:address],
    kontakt: Faker::PhoneNumber.phone_number,
    opening_hours: "Mo-Fr: #{rand(8..10)} Uhr - #{rand(16..18)} Uhr"
  )

  # Define image URLs with a fallback to a known URL
  image_urls = [
    "https://picsum.photos/300/300?random=#{i}",  # Random images from Picsum
    "https://placekitten.com/300/300",            # Kitten images
    "https://via.placeholder.com/300x300.png?text=Anbieter+#{i + 1}"  # Custom placeholder
  ]

end

puts "Seeding complete!"
