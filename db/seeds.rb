10.times do |i|
  User.create!(name: "test user#{i + 1}", email: "test#{i + 1}@example.com", password: "password", password_confirmation: "password")
  Task.create!(title: "タスク#{i + 1}", complete: [true, false].sample)
end

100.times do |n|
  Comment.create!(description: "コメント#{n + 1}", task_id: (1..10).to_a.sample, user_id: (1..10).to_a.sample)
end