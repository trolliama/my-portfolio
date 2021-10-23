# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create link types
["github", "linkedin", "medium"].each do |type|
    LinkType.create!(type_name: type)
    puts "Link type #{type} created"
end

puts "Created 3 link_types"

# Create projects
8.times do |i|
    project_title = "Project#{i}"
    project = Project.create!(title: project_title,
                    description:"Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    resume_card: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                    body: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                    )
    puts "Created #{project_title}"

    project.links.create!(name: "Link-#{project_title}",
                        link: "google.com",
                        link_type: LinkType.find(1))
    puts "Created github link for #{project_title}"
    
    project.links.create!(name: "Link2-#{project_title}",
                        link: "google.com",
                        link_type: LinkType.find(2))
    puts "Created medium link for #{project_title}"

    project.skill_list.add("Software Engineer, Hacking", parse:true)
    puts "Created 2 skills tags"

    project.technology_list.add("Python, Docker, AWS, RestAPI, Heroku, DjangoRestFramework", parse: true)
    puts "Created 2 technologies tags"

    project.save

end

puts "Created 8 projects, 16 links and 8 tags"

# create profile
profile = Profile.create!(
    title: "Main Profile",
    resume: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    career_path: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make",
    picture: "https://t3.ftcdn.net/jpg/03/91/19/22/360_F_391192211_2w5pQpFV1aozYQhcIw3FqA35vuTxJKrB.jpg"
)

puts "Created Main Profile"

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

profile.save

puts "Added 6 skills tags to Main Profile"

