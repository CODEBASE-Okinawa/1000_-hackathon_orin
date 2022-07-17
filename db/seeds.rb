puts 'start seed'
50.times do |i|
  User.create!(name: "test user#{i + 1}", email: "test#{i + 1}@example.com", password: "password", password_confirmation: "password")
end
puts 'created users'

10.times do |i|
  list = List.create!(title: "タスクリスト #{i + 1}")
  20.times do |j|
    list.tasks.create!(title: "タスク#{ j + 1 + (i * 20) }", complete: [true, false].sample)
  end
end
puts 'created lists and tasks'

100.times do |n|
  Comment.create!(description: "コメント#{n + 1}", task_id: (1..20).to_a.sample, user_id: (1..10).to_a.sample)
end
puts 'created comments'

10.times do |n|
  Project.create!(title: "プロジェクト#{n + 1}")
end
puts 'created project'

10.times do |n|
  project = Project.find(n + 1)
  UserProject.create!(user_id: (1..50).to_a.sample, project_id: project.id)
end
puts 'created user_projects'
puts 'created seed'