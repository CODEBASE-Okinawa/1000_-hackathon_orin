20.times do |n|
  Task.create!(title: "タスク#{n + 1}", status: [0, 1].sample)
end