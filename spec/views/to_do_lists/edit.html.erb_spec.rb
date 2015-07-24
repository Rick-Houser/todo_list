require 'spec_helper'

describe "to_do_lists/edit" do
  before(:each) do
    @to_do_list = assign(:to_do_list, stub_model(ToDoList,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit to_do_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", to_do_list_path(@to_do_list), "post" do
      assert_select "input#to_do_list_title[name=?]", "to_do_list[title]"
      assert_select "textarea#to_do_list_description[name=?]", "to_do_list[description]"
    end
  end
end
