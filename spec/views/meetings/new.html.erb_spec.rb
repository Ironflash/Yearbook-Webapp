require 'spec_helper'

describe "meetings/new" do
  before(:each) do
    assign(:meeting, stub_model(Meeting,
      :time => "MyString",
      :date => "MyString",
      :location => "MyString",
      :note => "MyText",
      :duration => "MyString",
      :attendees => "MyString"
    ).as_new_record)
  end

  it "renders new meeting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => meetings_path, :method => "post" do
      assert_select "input#meeting_time", :name => "meeting[time]"
      assert_select "input#meeting_date", :name => "meeting[date]"
      assert_select "input#meeting_location", :name => "meeting[location]"
      assert_select "textarea#meeting_note", :name => "meeting[note]"
      assert_select "input#meeting_duration", :name => "meeting[duration]"
      assert_select "input#meeting_attendees", :name => "meeting[attendees]"
    end
  end
end
