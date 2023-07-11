# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

50.times do |x|
    Post.create!(
      title: "This is my #{x} post on this thread app",
      user_id: 10
    )
end
50.times do |x|
    Comment.create!(
      title: "I have commented #{x} time on this thread",
      user_id: 10,
      post_id: 158
    )
end
