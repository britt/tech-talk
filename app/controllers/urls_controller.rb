class UrlsController < ApplicationController
  def new
    @short_url = Url.new
  end

  def create
    @short_url = Url.new(params[:url])
    @success = @short_url.save

    respond_to do |format|
      format.html do
        if @success
          redirect_to url_path(@short_url)
        else
          render :action => 'new'
        end
      end

      format.js
    end
  end

  def show
    @short_url = Url.find(params[:id])
  end
end