steven = User.create(name: "steven", email: "steven@steven.com", password: "steven")
george = User.create(name: "george", email: "george@george.com", password: "george")
dan = User.create(name: "dan", email: "apczynski@gmail.com", password: "dan")

steve_survey = steven.surveys.create(label: "Star Wars Villains", description: "This is a survey about Star Wars villains")

steve_question = steve_survey.questions.create(label: "Who is the baddest villain of them all?")

choice1 = steve_question.choices.create(label: "Darth Vader")
choice2 = steve_question.choices.create(label: "JarJar Binks")
choice3 = steve_question.choices.create(label: "Boba Fett")

steve_survey.takers.create(user: george)

george.responses.create(choice: choice1)

dan_survey = dan.surveys.create(label: "Star Wars Survey", description: "The Star Wars films may have changed the world of sci-fi forever, but it has created many questions that endure to this day. Let's try to settle some of the age-old questions.")

dan_question1 = dan_survey.questions.create(label: "Who shot first?")

choice1 = dan_question1.choices.create(label: "Han Solo")
choice2 = dan_question1.choices.create(label: "Greedo")