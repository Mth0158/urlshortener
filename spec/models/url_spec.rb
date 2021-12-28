require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'Validations' do
    describe '#long_url' do
      it { should validate_presence_of(:long_url) }
      it { should allow_value("https://www.google.com").for(:long_url) }
      it { should allow_value("http://www.google.com").for(:long_url) }
      it { should allow_value("https://google.com").for(:long_url) }
      it { should allow_value("https://www.google.fr").for(:long_url) }
      it { should_not allow_value("foo").for(:long_url) }
      it { should_not allow_value("www.google.com").for(:long_url) }
      it { should_not allow_value("google.com").for(:long_url) }
    end

    describe '#alias' do
      it { should validate_uniqueness_of(:alias) }
    end
  end

  describe "#name" do
    it "creates a slug of type string for the tiny url when no alias is provided" do
      no_alias_url = Url.create(long_url: "https://www.google.com")
      expect(no_alias_url.slug).to be_a_kind_of(String)
    end

    it "creates a slug equal to the alias provided for tiny url when an alias is provided" do
      alias_url = Url.create(long_url: "https://www.google.com", alias: "myalias")
      expect(alias_url.slug).to be_a_kind_of(String)
      expect(alias_url.slug).to eq(alias_url.alias)
    end
  end
end
