# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

User.create! [
  { username: 'Fiorina', password_digest: '#1' },
  { username: 'Trump', password_digest: '#2' },
  { username: 'Carson', password_digest: '#3' },
  { username: 'Clinton', password_digest: '#4' }
]

Profile.create! [
  { gender: 'female', birth_year: 1954,
    first_name: 'Carly', last_name: 'Fiorina', user_id: 1 },
  { gender: 'male', birth_year: 1946,
    first_name: 'Donald', last_name: 'Trump', user_id: 2 },
  { gender: 'male', birth_year: 1951,
    first_name: 'Ben', last_name: 'Carson', user_id: 3 },
  { gender: 'female', birth_year: 1947,
    first_name: 'Hillary', last_name: 'Clinton', user_id: 4 }
]

User.all.each do |user|
  user.todo_lists.create! [
    { list_name: user[:username] + ' list ', list_due_date: Date.today + 1.year }
  ]
end

TodoList.all.each do |list|
  5.times do |i|
    list.todo_items.create! [
      { title: list[:id].to_s + ' item ' + i.to_s,
        due_date: Date.today + 1.year,
        description: list[:id].to_s + ' item ' + i.to_s,
        completed: false }
    ]
  end
end