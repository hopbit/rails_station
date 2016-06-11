require "rails_helper"

describe "Routes, controllers and views", type: :feature do
  it "has homepage with the application name" do
    visit "/"
    expect(page).to have_content("Special days reminder app")
  end

  it "displays current date (pass it from the controller)" do
    visit "/"
    expect(page).to have_content("Today is #{Time.current.strftime("%B %-d")}")
  end

  it "has a dashboard page which displays the upcased name of the user passed in the URL" do
    visit "/dashboard/adam"
    expect(page).to have_content("Hello ADAM!")
  end

  it "displays <<Welcome to your dashboard>> if the name is longer than 4 characters" do
    visit "/dashboard/johnny"
    expect(page).to have_content("Welcome to your dashboard")
    visit "/dashboard/joe"
    expect(page).to have_no_content("Welcome to your dashboard")
  end

  it "displays possible events in the homepage (pass array from the controller and use a loop)" do
    visit "/"
    expect(page).to have_content("birthday nameday Mother's Day")
  end
end
