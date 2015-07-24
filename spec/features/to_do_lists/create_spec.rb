require 'spec_helper'

describe "Creating todo lists" do
	def create_todo_list(options={})
		options[:title] ||= "My todo list"
		options[:description] ||= "This is my todo list."

		visit "/to_do_lists"
		click_link "New To do list"
		expect(page).to have_content("New To Do List")

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Create To do list"
	end

	it "redirects to the todo list index page on success" do 
		create_todo_list
		expect(page).to have_content("My todo list")
	end	

	it "displays an error when the todo list has no title" do
		expect(ToDoList.count).to eq(0)

		create_todo_list title: ""

		expect(page).to have_content("error")
		expect(ToDoList.count).to eq(0)

		visit "/to_do_lists"
		expect(page).to_not have_content("This is what I'm doing today.")

	end

	it "displays an error when the todo list has a title less than 3 characters" do
		expect(ToDoList.count).to eq(0)

		create_todo_list title: "Hi"

		expect(page).to have_content("error")
		expect(ToDoList.count).to eq(0)

		visit "/to_do_lists"
		expect(page).to_not have_content("This is what I'm doing today.")
	end

		it "displays an error when the todo list has no description" do
		expect(ToDoList.count).to eq(0)

		create_todo_list title: "Grocery list", description: ""

		expect(page).to have_content("error")
		expect(ToDoList.count).to eq(0)

		visit "/to_do_lists"
		expect(page).to_not have_content("Grocery list")
	end


		it "displays an error when the description is less than 5 characters" do
		expect(ToDoList.count).to eq(0)

		create_todo_list title: "Grocery list", description: "Food"		

		expect(page).to have_content("error")
		expect(ToDoList.count).to eq(0)

		visit "/to_do_lists"
		expect(page).to_not have_content("Grocery list")
	end
end


