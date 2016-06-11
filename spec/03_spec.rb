require "rails_helper"

describe "Forms and validations", type: :feature do
  it "renders the form for creating new special day" do
    visit "/special_days/new"
    expect(page).to have_field("special_day_name")
    expect(page).to have_field("special_day_when")
    expect(page).to have_button("Create!")
  end

  it "creates new database record when form is submitted" do
    visit "/special_days/new"
    fill_in "special_day_name", with: "Birthday"
    fill_in "special_day_when", with: "15/07/2016"
    expect { click_button "Create!" }.to change { SpecialDay.count }.by(1)
    expect(SpecialDay.last.name).to eq "Birthday"
    expect(SpecialDay.last.when).to eq Date.new(2016, 7, 15)
  end

  it "redirects to the list of special days when form is submitted" do
    visit "/special_days/new"
    fill_in "special_day_name", with: "Birthday"
    fill_in "special_day_when", with: "15/07/2016"
    click_button "Create!"
    expect(current_path).to eq "/special_days"
  end

  it "does not allow special days without name" do
    special_day = SpecialDay.new(name: "", when: Date.new(2016, 8, 23))
    expect(special_day.valid?).to eq false
  end

  it "does not allow special days without date" do
    special_day = SpecialDay.new(name: "Test", when: "")
    expect(special_day.valid?).to eq false
  end

  it "shows errors when form is submitted" do
    visit "/special_days/new"
    click_button "Create!"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "When can't be blank"
  end
end
