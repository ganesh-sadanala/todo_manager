class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{formatted_due_date} #{todo_text} #{is_completed}"
  end

  def formatted_due_date
    due_date == nil ? "no due date set," : due_date.to_s(:long)
  end
end
