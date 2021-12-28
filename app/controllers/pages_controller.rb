class PagesController < ApplicationController
  def home
    @url = Url.new
  end

  def newurl
    @url = Url.find(params[:url_id]) if params[:url_id]
  end
end
