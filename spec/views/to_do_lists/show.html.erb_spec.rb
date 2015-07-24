require 'spec_helper'

describe "to_do_lists/show" do
  before(:each) do
    @to_do_list = assign(:to_do_list, stub_model(ToDoList,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
