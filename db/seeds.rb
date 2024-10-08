# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'  # Faker gem to generate random data
require 'open-uri'



puts "Seeding consultations..."

Consultation.delete_all # deelete all previous data

25.times do |i|
  consultation = Consultation.create!(
    name: "#{Faker::Company.name} Consultation",
    address: Faker::Address.full_address,
    kontakt: Faker::PhoneNumber.phone_number,
    opening_hours: "Mon-Fri: #{rand(8..10)}AM - #{rand(4..6)}PM"
  )

  # Define image URLs with a fallback to a known URL
  image_urls = [
    "https://picsum.photos/300/300?random=#{i}",  # Random images from Picsum
    "https://placekitten.com/300/300",            # Kitten images
    "https://via.placeholder.com/300x300.png?text=Consultation+#{i + 1}"  # Custom placeholder
  ]

  random_image_url = image_urls.sample  # Choose a random image URL for the specific consultation

  attempts = 0
  begin
    # Attach the selected random image to the consultation
    file = URI.open(random_image_url)
    consultation.image.attach(io: file, filename: "consultation_#{i + 1}.png")
    puts "Created Consultation #{i + 1}: #{consultation.name}, Image: #{random_image_url}"
  rescue OpenURI::HTTPError => e
    attempts += 1
    puts "Failed to attach image for Consultation #{i + 1} on attempt #{attempts}: #{e.message}"
    retry if attempts < 3  # Retry up to 3 times
  rescue StandardError => e
    puts "An error occurred for Consultation #{i + 1}: #{e.message}"
  ensure
    sleep(0.5)  # Sleep briefly between requests to avoid rate limits
  end
end

puts "Seeding complete!"
