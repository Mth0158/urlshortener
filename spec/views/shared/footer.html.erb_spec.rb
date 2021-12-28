require 'rails_helper'

RSpec.describe "shared/_footer.html.erb", type: :view do
  it "displays a copyright disclaimer" do
    render

    expect(rendered).to match  /©2021, Url shortener  - Tous droits réservés/
  end
end
