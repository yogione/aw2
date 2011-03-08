require 'spec_helper'

describe "retirees/show.html.erb" do
  before(:each) do
    @retiree = assign(:retiree, stub_model(Retiree,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Plant/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Pet Story/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/What Are You Doing/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Photo Path1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Video Path1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Message To Ceo/)
  end
end
