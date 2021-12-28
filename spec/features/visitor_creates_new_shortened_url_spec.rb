require 'spec_helper'
require 'capybara/rspec'

RSpec.feature "Create new shortened url", type: :feature do
  # Only url
  scenario 'with valid url' do
    create_new_url_with 'https://www.google.com'

    expect(page).to have_css('div.newurl')
  end

  scenario 'with invalid url' do
    create_new_url_with 'not valid'

    expect(page).to have_css('div.home')
  end

  # Url and alias
  scenario 'with valid url and available alias' do
    create_new_url_with 'https://www.google.com', 'available_alias2'

    expect(page).to have_css('div.newurl')
  end

  scenario 'with valid url and not available alias' do
    create_new_url_with 'https://www.google.com', 'not_available_alias'

    expect(page).to have_css('div.home')
  end

  scenario 'with invalid url and available alias' do
    create_new_url_with 'valid@example.com', 'available_alias'

    expect(page).to have_css('div.home')
  end

  scenario 'with invalid url and not available alias' do
    create_new_url_with 'valid@example.com', 'not_available_alias'

    expect(page).to have_css('div.home')
  end

  def create_new_url_with(long_url, alias_url = nil)
    visit root_path
    fill_in 'Enter a long url to convert it into a shorter url', with: long_url
    fill_in 'Customize your url', with: alias_url if alias_url
    click_button 'Shorten my url!'
  end
end
