class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{formatted_due_date} #{todo_text} #{is_completed}"
  end

  def formatted_due_date
    due_date == nil ? "no due date set," : due_date.to_s(:long)
  end

  def due_today?
    due_date == Date.today
  end

  def self.overdue
    where("due_date<? and completed=?", Date.today, false)
  end

  def self.due_today
    where("due_date=?", Date.today)
  end

  def self.due_later
    where("due_date>?", Date.today)
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{display_status} #{todo_text} #{display_date}"
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue\n"
    overdue_list = overdue.map { |todo| "#{todo.id}. ".concat(todo.to_displayable_string) }
    puts overdue_list.join("\n")
    puts "\n\n"

    puts "Due Today\n"
    duetoday_list = due_today.map { |todo| "#{todo.id}. ".concat(todo.to_displayable_string) }
    puts duetoday_list.join("\n")
    puts "\n\n"

    puts "Due Later\n"
    duelater_list = due_later.map { |todo| "#{todo.id}. ".concat(todo.to_displayable_string) }
    puts duelater_list.join("\n")
    puts "\n\n"
  end

  def self.add_task(h)
    Todo.create!(todo_text: h[:todo_text], due_date: Date.today + h[:due_in_days], completed: false)
    Todo.last
  end

  def self.mark_as_complete!(todo_id)
    todoById = Todo.find(todo_id)
    todoById.completed = true
    todoById.save
    todoById
  end
  def self.completed
    where(completed: true)
  end
end
