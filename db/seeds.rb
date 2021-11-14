# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create link types
[ "github", "linkedin", "medium", "demo" ].each do |value|
  LinkType.create!(type_name: value, icon: value)
  puts "Link type #{value} created"
end

puts "Created 4 link_types"

# Create projects
8.times do |i|
  project_title = "Project#{i}"
  project = Project.new(title: project_title,
                        description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                        resume_card: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                        body: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")
  puts "Created new #{project_title} object"

  project.main_image.attach(io: File.open(Rails.root.join("app", "assets", "images", "project_image.png")), filename: "main_image.png")
  project.thumb_image.attach(io: File.open(Rails.root.join("app", "assets", "images", "project_image.png")), filename: "thumb_image.png")

  puts "Attached main and thumb image to #{project_title}"

  project.save

  project.links.create!(name: "Link-#{project_title}",
                        tooltip: "source code",
                        link: "https://google.com",
                        link_type: LinkType.where(type_name: "github").first)

  puts "Created github link for #{project_title}"

  project.links.create!(name: "Link2-#{project_title}",
                        tooltip: "demo",
                        link: "https://google.com",
                        link_type: LinkType.where(type_name: "demo").first)

  puts "Created demo link for #{project_title}"

  project.skill_list.add("Software Engineer, Hacking", parse: true)
  puts "Created 2 skills tags"

  project.technology_list.add("Python, Docker, AWS, RestAPI, Heroku, DjangoRestFramework", parse: true)
  puts "Created 2 technologies tags"

  project.save

  puts "Saved #{project_title} in the database"

end

puts "Created 8 projects, 16 links and 8 tags"

# create profile
profile = Profile.new(
  title: "Main Profile",
  resume: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
  career_path: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make",
)

puts "Created New Main Profile Object"

profile.picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "profile_test.jpg")), filename: "profile_test.jpg")

puts "Attached profile picture"

profile.save

puts "Saved profile in the database"

(1..3).each do |i|
  profile.projects << Project.find(i)
end

puts "Added 3 projects to Main Profile"

["Python", "Docker", "AWS", "Heroku", "Django", "Ruby on Rails"].each do |tech_tag|
  profile.technology_list.add(tech_tag)
end

puts "Added 6 tech tags to Main Profile"

["Design Patterns", "Hacking", "Data Science"].each do |skill_tag|
  profile.skill_list.add(skill_tag)
end

puts "Added 3 skills tags to Main Profile"

profile.links.create!(name: "My Github",
                      tooltip: "my github profile",
                      link: "https://github.com/trolliama",
                      link_type: LinkType.where(type_name: "github").first)
profile.links.create!(name: "My Medium",
                      tooltip: "my medium profile",
                      link: "https://google.com",
                      link_type: LinkType.where(type_name: "medium").first)
profile.links.create!(name: "My Linkedin",
                      tooltip: "my linkedin profile",
                      link: "https://www.linkedin.com/in/caio-wanderley-144580145/",
                      link_type: LinkType.where(type_name: "linkedin").first)

profile.save