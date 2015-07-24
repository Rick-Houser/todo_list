class TodoItemsController < ApplicationController
  def index
  	@todo_list = TodoList.find(params[:to_do_list_id])
  end
end
