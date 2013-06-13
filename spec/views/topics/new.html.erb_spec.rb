require 'spec_helper'

describe "topics/new" do
  before(:each) do
    assign(:topic, stub_model(Topic,
      :subject => "MyString",
      :name => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", topics_path, "post" do
      assert_select "input#topic_subject[name=?]", "topic[subject]"
      assert_select "input#topic_name[name=?]", "topic[name]"
      assert_select "textarea#topic_body[name=?]", "topic[body]"
    end
  end
end
