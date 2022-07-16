20.times do |n|
  Task.create!(title: "タスク#{n + 1}", complete: [true, false].sample)
end