class UrlsController < ApplicationController
  def new
    @short_url = Url.new  
  end

  def create
    @short_url = Url.new(params[:url])
    if @short_url.save
      redirect_to url_path(@short_url)
    else
      render :action => 'new'
    end
  end

  def show
    @short_url = Url.find(params[:id])
  end
end