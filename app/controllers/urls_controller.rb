class UrlsController < ApplicationController
  before_action :set_url, only: [:show]

  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to newurl_path(params: {url_id: @url.id})
    else
      render 'pages/home'
    end
  end

  def show
    redirect_to "#{@url.long_url}"
  end

  private

  def set_url
    @url = Url.friendly.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:long_url, :alias)
  end
end
