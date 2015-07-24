require 'spec_helper'

describe "to_do_lists/index" do
  before(:each) do
    assign(:to_do_lists, [
      stub_model(ToDoList,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(ToDoList,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of to_do_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
