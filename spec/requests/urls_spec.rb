require 'rails_helper'

RSpec.describe "Urls", type: :routing do
  describe "POST /create" do
    it { should route(:post, '/urls').to(controller: :urls, action: :create) }
  end

  describe "GET /show" do
    it { should route(:get, '/1').to(controller: :urls, action: :show, id: 1) }
  end

end
