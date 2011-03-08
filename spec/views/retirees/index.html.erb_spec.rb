require 'spec_helper'

describe "retirees/index.html.erb" do
  before(:each) do
    assign(:retirees, [
      stub_model(Retiree,
        :user_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :years_worked => 1,
        :plant => "Plant",
        :pet_story => "Pet Story",
        :what_are_you_doing => "What Are You Doing",
        :photo_path1 => "Photo Path1",
        :video_path1 => "Video Path1",
        :message_to_ceo => "Message To Ceo"
      ),
      stub_model(Retiree,
        :user_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :years_worked => 1,
        :plant => "Plant",
        :pet_story => "Pet Story",
        :what_are_you_doing => "What Are You Doing",
        :photo_path1 => "Photo Path1",
        :video_path1 => "Video Path1",
        :message_to_ceo => "Message To Ceo"
      )
    ])
  end

  it "renders a list of retirees" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Plant".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pet Story".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "What Are You Doing".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Photo Path1".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Video Path1".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Message To Ceo".to_s, :count => 2
  end
end
