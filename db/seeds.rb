10.times do |i|
  User.create!(name: "test user#{i + 1}", email: "test#{i + 1}@example.com", password: "password", password_confirmation: "password")
end

10.times do |i|
  list = List.create!(title: "タスクリスト #{i + 1}")
  20.times do |j|
    list.tasks.create!(title: "タスク#{j + 1}", complete: [true, false].sample)
  end
end

100.times do |n|
  Comment.create!(description: "コメント#{n + 1}", task_id: (1..20).to_a.sample, user_id: (1..10).to_a.sample)
end
