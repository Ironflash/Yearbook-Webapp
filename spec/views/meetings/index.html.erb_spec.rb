require 'spec_helper'

describe "meetings/index" do
  before(:each) do
    assign(:meetings, [
      stub_model(Meeting,
        :time => "Time",
        :date => "Date",
        :location => "Location",
        :note => "MyText",
        :duration => "Duration",
        :attendees => "Attendees"
      ),
      stub_model(Meeting,
        :time => "Time",
        :date => "Date",
        :location => "Location",
        :note => "MyText",
        :duration => "Duration",
        :attendees => "Attendees"
      )
    ])
  end

  it "renders a list of meetings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Time".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Duration".to_s, :count => 2
    assert_select "tr>td", :text => "Attendees".to_s, :count => 2
  end
end
