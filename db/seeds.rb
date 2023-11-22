# # Clear existing projects
# Project.destroy_all

# # Seed data
# 10.times do
#   title = Faker::Lorem.unique.sentence
#   description = Faker::Lorem.paragraph
#   is_public = [true, false].sample
#   is_featured = [true, false].sample
#   view_count = rand(1..100)

#   # Assuming you have a User model and you want to associate a random user with each project
#   user = User.order("RANDOM()").first
#   Project.create!(
#     title: title,
#     description: description,
#     is_public: is_public,
#     is_featured: is_featured,
#     view_count: view_count,
#     user: user
#   )
# end

# puts "Seed data created successfully."

# Rest of your code for FilteredWord creation...


# Add profanity words to the ProfanityFilter table
# profanity_words = ["profanity", "explicit", "vulgar", "inappropriate"]

# profanity_words.each do |word|
#   ProfanityFilter.create(word: word)
# end


# ProfanityFilter.create(word: "stupid")


# FilteredWord.create(word: "profanity1")
# FilteredWord.create(word: "profanity2")
# FilteredWord.create(word: "inappropriate1")
# FilteredWord.create(word: "inappropriate2")

10.times do |i|
  FilteredWord.create(word: "word_#{i}")
end
