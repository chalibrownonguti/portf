
# Project.create(
#   title: "Sample Project 1",
#   description: "This is the first sample project description.",
#   is_public: true,
#   is_featured: true
# )

# Project.create(
#   title: "Sample Project 2",
#   description: "This is the second sample project description.",
#   is_public: true,
#   is_featured: false
# )


require 'faker'


Project.destroy_all

# Seed data
10.times do
  title = Faker::Lorem.unique.sentence
  description = Faker::Lorem.paragraph
  is_public = [true, false].sample
  is_featured = [true, false].sample
  view_count = rand(1..100)

  Project.create!(
    title: title,
    description: description,
    is_public: is_public,
    is_featured: is_featured,
    view_count: view_count
  )
end

puts "Seed data created successfully."
