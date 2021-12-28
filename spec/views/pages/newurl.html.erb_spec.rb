require 'rails_helper'

RSpec.describe "pages/newurl.html.erb", type: :view do
  it "displays a back link to the root path" do
    render

    expect(rendered).to have_link 'Convert another tiny url', href: '/'
  end
end
