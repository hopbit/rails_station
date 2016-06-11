require "rails_helper"

describe "Associations", type: :feature do
  it "has Comment model with content field" do
    expect(Comment.count).to eq 0
    comment = Comment.new
    expect(comment).to respond_to(:content)
  end

  it "creates association between SpecialDay and Comment" do
    special_day = SpecialDay.create!(name: "Birthday", when: Date.new(2016, 7, 25))
    special_day.comments.create!(content: "Awesome party!")
    special_day.comments.create!(content: "Oh no...")
    expect(Comment.count).to eq 2
  end

  it "displays associated comments in special day details page" do
    special_day = SpecialDay.create!(name: "Birthday", when: Date.new(2016, 7, 25))
    special_day.comments.create!(content: "Awesome party!")
    special_day.comments.create!(content: "Oh no...")
    visit special_day_path(special_day)
    expect(page).to have_content("Awesome party!")
    expect(page).to have_content("Oh no...")
  end
end
