require 'rails_helper'

RSpec.describe "shared/_navbar.html.erb", type: :view do
  it "displays a link to the root path" do
    render

    expect(rendered).to have_link 'Url shortener', href: '/'
  end
end
