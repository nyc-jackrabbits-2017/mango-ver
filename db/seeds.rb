User.destroy_all
Question.destroy_all
Answer.destroy_all
Comment.destroy_all
Vote.destroy_all

user1 = User.create(username: "bob", password:"password")
user2 = User.create(username: "jim", password:"password")
user3 = User.create(username: "johnny", password:"password")

questions_arr = ["Rails: CoffeeScript is not defined on new Application",
                "Getting GoogleMapsService::Error::ApiError (GoogleMapsService::Error::ApiError) even though the key works",
                "What is wrong with this Rspec stub?",
                "CSV::MalformedCSVError: Illegal quoting"
                ]
question_desc_arr = ["I am getting this error on a new rails app after creating a controller with rails g controller hello index. Rails is having a problem adding the css file and javascript file. Rails has worked fine before this:",
                    "All of the sudden, I get this error: GoogleMapsService::Error::ApiError (GoogleMapsService::Error::ApiError): when running my code. When I run rails console, and run it line by line manually, routes return successfully with no ApiError. I have searched for answers online but with no success. Please help.",
                    "have stubbed out my API client. And have gotten it to return an expected hash. But I am not able to access the actual hash itself. E.g puts page # returns {:access_token=>blah, :name=>...",
                    "I followed the advice of another SO question that asked this very same question. I added the quote_char option as so: CSV.foreach(path, headers: true, quote_char: ) do |row| rows = row.to_hash...."
                    ]

answer_arr = ["This is the answer..., please check your environment variables",
              "You might want to do a bundle install. that may be it...",
              "I'm not too sure, but try restarting your computer"
              ]

comment_arr = ["This is a comment. I like what you said.",
              "That's not necessarily true",
              "I'm not sure that's the issue...",
              "I love MANGO-ver!!!!!!!!!"
              ]

question1 = Question.create(title: questions_arr[0], description: question_desc_arr[0])
question2 = Question.create(title: questions_arr[1], description: question_desc_arr[1])
question3 = Question.create(title: questions_arr[2], description: question_desc_arr[2])
question4 = Question.create(title: questions_arr[3], description: question_desc_arr[3])

user1.questions << question1
user1.questions << question4
user2.questions << question2
user3.questions << question3

15.times do
  User.all.sample.answers.create(question_id: rand(1..4), description: answer_arr.sample)
end

30.times do
  User.all.sample.answers.sample.comments.create(description: comment_arr.sample)
  User.all.sample.questions.sample.comments.create(description: comment_arr.sample)
end

100.times do
  User.all.sample.answers.sample.votes.create(vote_value: [1,-1].sample)
  User.all.sample.questions.sample.votes.create(vote_value: [1,-1].sample)
end
