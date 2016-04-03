question_ammount = 10
answer_ammount = 30
comment_ammount = 90
tag_ammount = 9
tag_question_ammount = 20
favorite_ammount = 60

User.create(
    username: "Chewwwwwy",
    email: "Cbakkabakka@gmail.company_name",
    password: "pw",
    first_name: "Chew",
    last_name: "Baka",
    company_name: "Millenial F, LLC",
    role: "Co-founder, Co-Pilot, Engineer, General Badass",
    recovery_mom_maiden_name: "momma",
    recovery_first_street: "jungle path",
    recovery_first_pet: "my gun"
    )

User.create(
    username: "sk_walker",
    email: "lsw@gmail.com",
    password: "pw",
    first_name: "Luke",
    last_name: "Skywalker",
    company_name: "Jedi Council / The Resistance",
    role: "That Dude",
    recovery_mom_maiden_name: "Amidala",
    recovery_first_street: "fuck tatooine",
    recovery_first_pet: "r2d2"
    )

User.create(
    username: "alderaan_forever",
    email: "leia@gmail.com",
    password: "pw",
    first_name: "Leia",
    last_name: "Skywalker",
    company_name: "The Resistance",
    role: "General",
    recovery_mom_maiden_name: "Amidala",
    recovery_first_street: "The Castle",
    recovery_first_pet: "blah"
    )

User.create(
    username: "so_lo",
    email: "h.solo@gmail.com",
    password: "pw",
    first_name: "Han",
    last_name: "solo",
    company_name: "Millenial F, LLC",
    role: "Founder",
    recovery_mom_maiden_name: "whos asking",
    recovery_first_street: "dusty road on a dark rock",
    recovery_first_pet: "blah"
    )

User.create(
    username: "__darksiiiiiide",
    email: "d_v@gmail.com",
    password: "pw",
    first_name: "Anakin",
    last_name: "Skywalker",
    company_name: "The Empire",
    role: "Sith Lord",
    recovery_mom_maiden_name: "I have no mother",
    recovery_first_street: "I have no past",
    recovery_first_pet: "fuck you"
    )

commentable_type_array = ["Answer", "Question"]
comment_ammount.times do
  Comment.create(
    comment_text: Faker::Lorem.paragraph(rand(1..4)),
    commentable_id: rand(1..30),
    commentable_type: commentable_type_array.sample,
    user_id: rand(1..5)
    )
end


question_ammount.times do
  Question.create(
    question_text: Faker::StarWars.quote + "?",
    user_id: rand(1..5)
    )
end

until (Tag.all.length == 9) do
  Tag.create(
    tag_name: Faker::StarWars.specie
    )
end

Tag.create(tag_name: 'Sith')
Tag.create(tag_name: 'Jedi')
Tag.create(tag_name: 'Yuuzhan Vong')

tag_question_ammount.times do
  TagQuestion.create(
    question_id: rand(1..10),
    tag_id: rand(1..10)
    )
end

answer_ammount.times do
  Answer.create(
    answer_text: Faker::StarWars.quote + "!",
    user_id: rand(1..5),
    question_id: rand(1..12)
    )
end

commentable_type_array = ["Answer", "Question"]
favorite_ammount.times do
    Favorite.create(
        user_id: rand(1..5),
        favoritable_id: rand(1..30),
        favoritable_type: commentable_type_array.sample
        )
end
