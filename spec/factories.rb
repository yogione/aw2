Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end
Factory.define :story do |story|
  story.title "Hundai beats GM"
  story.teaser "Hundai beats GM"
  story.url "Hundai beats GM"
  story.user_id 1
  story.votes 10
  story.association :user
end