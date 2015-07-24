require 'spec_helper'

describe "Creating todo lists" do
	it "redirects to the todo list index page on success" do 
		visit "/to_do_lists"
		click_link "New To do list"
		expect(page).to have_content("New To Do List")

		fill_in "Title", with: "My todo list"
		fill_in "Description", with: "This is what I'm doing today."
		click_button "Create To do list"

		expect(page).to have_content("My todo list")
	end	

	it "displays an error when the todo list has no title" do
		expect(ToDoList.count).to eq(0)

		visit "/to_do_lists"
		click_link "New To do list"
		expect(page).to have_content("New To Do List")

		fill_in "Title", with: ""
		fill_in "Description", with: "This is what I'm doing today."
		click_button "Create To do list"

		expect(page).to have_content("error")
		expect(ToDoList.count).to eq(0)

		visit "/to_do_lists"
		expect(page).to_not have_content("This is what I'm doing today.")

	end

	it "displays an error when the todo list has a title less than 3 characters" do
		expect(ToDoList.count).to eq(0)

		visit "/to_do_lists"
		click_link "New To do list"
		expect(page).to have_content("New To Do List")

		fill_in "Title", with: "Hi"
		fill_in "Description", with: "This is what I'm doing today."
		click_button "Create To do list"

		expect(page).to have_content("error")
		expect(ToDoList.count).to eq(0)

		visit "/to_do_lists"
		expect(page).to_not have_content("This is what I'm doing today.")
	end
end