require "rails_helper"

describe "Models and migrations", type: :feature do
  it "has SpecialDay model" do
    special_day = SpecialDay.new(name: "Birthday", when: Time.current)
    expect(special_day.name).to eq "Birthday"
  end

  it "is possible to save the model to the database" do
    expect(SpecialDay.count).to eq 0
    special_day = SpecialDay.new(name: "Birthday", when: Time.current)
    special_day.save!
    expect(SpecialDay.count).to eq 1
  end

  it "shows all special days at /special_days" do
    SpecialDay.create!(name: "Christmas", when: Date.new(2016, 12, 24))
    SpecialDay.create!(name: "Birthday", when: Date.new(2016, 10, 21))

    visit "/special_days"
    expect(page).to have_content("Christmas - 24-12-2016")
    expect(page).to have_content("Birthday - 21-10-2016")
  end

  it "shows details of a single day at /special_days/:id" do
    special_day = SpecialDay.create!(name: "Christmas", when: Date.new(2016, 12, 24))

    visit "/special_days/#{special_day.id}"
    expect(page).to have_content("Christmas - 24-12-2016")
  end

  it "links to the details page from the list page" do
    special_day = SpecialDay.create!(name: "Christmas", when: Date.new(2016, 12, 24))

    visit "/special_days"
    click_on "Christmas"
    expect(current_path).to eq "/special_days/#{special_day.id}"
  end

  it "uses idiomatic routing with <<resources>> method" do
    special_day = SpecialDay.create!(name: "Christmas", when: Date.new(2016, 12, 24))

    expect(special_days_path).to eq "/special_days"
    expect(special_day_path(special_day)).to eq "/special_days/#{special_day.id}"
  end
end
