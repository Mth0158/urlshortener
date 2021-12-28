require 'rails_helper'

RSpec.describe "pages/newurl.html.erb", type: :view do

  let(:google_url) { Url.new(long_url: "https://www.google.com", id: 1, slug: "google")}

  it "displays a back link to the root path" do
    assign(:url, google_url)

    render

    expect(rendered).to have_link 'Shorten another url', href: '/'
  end
end
