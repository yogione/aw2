require 'spec_helper'

describe "retirees/new.html.erb" do
  before(:each) do
    assign(:retiree, stub_model(Retiree,
      :user_id => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :years_worked => 1,
      :plant => "MyString",
      :pet_story => "MyString",
      :what_are_you_doing => "MyString",
      :photo_path1 => "MyString",
      :video_path1 => "MyString",
      :message_to_ceo => "MyString"
    ).as_new_record)
  end

  it "renders new retiree form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => retirees_path, :method => "post" do
      assert_select "input#retiree_user_id", :name => "retiree[user_id]"
      assert_select "input#retiree_first_name", :name => "retiree[first_name]"
      assert_select "input#retiree_last_name", :name => "retiree[last_name]"
      assert_select "input#retiree_years_worked", :name => "retiree[years_worked]"
      assert_select "input#retiree_plant", :name => "retiree[plant]"
      assert_select "input#retiree_pet_story", :name => "retiree[pet_story]"
      assert_select "input#retiree_what_are_you_doing", :name => "retiree[what_are_you_doing]"
      assert_select "input#retiree_photo_path1", :name => "retiree[photo_path1]"
      assert_select "input#retiree_video_path1", :name => "retiree[video_path1]"
      assert_select "input#retiree_message_to_ceo", :name => "retiree[message_to_ceo]"
    end
  end
end
