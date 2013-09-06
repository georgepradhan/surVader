steven = User.create(name: "steven", email: "steven@steven.com", password: "steven")
george = User.create(name: "george", email: "george@george.com", password: "george")


steve_survey = steven.surveys.create(label: "Star Wars Villains", description: "This is a survey about Star Wars villains")

steve_question = steve_survey.questions.create(label: "Who is the baddest villain of them all?")

choice1 = steve_question.choices.create(label: "Darth Vader")
choice2 = steve_question.choices.create(label: "JarJar Binks")
choice3 = steve_question.choices.create(label: "Boba Fett")

steve_survey.takers.create(user: george)

george.responses.create(choice: choice1)

