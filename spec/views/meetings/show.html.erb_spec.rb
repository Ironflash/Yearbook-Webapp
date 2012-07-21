require 'spec_helper'

describe "meetings/show" do
  before(:each) do
    @meeting = assign(:meeting, stub_model(Meeting,
      :time => "Time",
      :date => "Date",
      :location => "Location",
      :note => "MyText",
      :duration => "Duration",
      :attendees => "Attendees"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Time/)
    rendered.should match(/Date/)
    rendered.should match(/Location/)
    rendered.should match(/MyText/)
    rendered.should match(/Duration/)
    rendered.should match(/Attendees/)
  end
end
