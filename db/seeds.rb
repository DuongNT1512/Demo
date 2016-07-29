
User.create!(name:  "Example User", email: "example01@railstutorial.org",
  password: "foobar", password_confirmation: "foobar",gender: "nu", admin: true,
  activated: true, activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password, gender: "nu", activated: true,
    activated_at: Time.zone.now)
end
