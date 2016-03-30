user_ammount = 5
question_ammount = 10
answer_ammount = 30
comment_ammount = 90
tag_ammount = 20
tag_question_ammount = 20

user_ammount.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "pw",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_name: Faker::Company.name,
    role: Faker::Company.profession,
    recovery_mom_maiden_name: "momma",  
    recovery_first_street: "broad street",
    recovery_first_pet: "garfield"
    )
end

commentable_type_array = ["Answer", "Question"]
comment_ammount.times do 
  Comment.create(
    comment_text: Faker::Lorem.paragraph(rand(1..4)),
    commentable_id: rand(1..30),
    commentable_type: commentable_type_array.sample,
    user_id: rand(1..5)
    )
end

answer_ammount.times do 
  Answer.create(
    answer_text: Faker::Lorem.paragraph(rand(1..4)),
    user_id: rand(1..5),
    question_id: rand(1..10)
    )
end

question_ammount.times do 
  Question.create(
    question_text: Faker::Lorem.paragraph(rand(1..4)),
    user_id: rand(1..5)
    )
end

tag_ammount.times do 
  Tag.create(
    tag_name: Faker::Hacker.adjective
    )
end

tag_question_ammount.times do  
  TagQuestion.create(
    question_id: rand(1..10),
    tag_id: rand(1..20)
    )
end
