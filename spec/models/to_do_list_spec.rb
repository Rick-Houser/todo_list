require 'spec_helper'

describe ToDoList do
  it {should have_many(:todo_items)}
end
