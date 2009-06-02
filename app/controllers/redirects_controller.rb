class RedirectsController < ApplicationController
  def show
    @url = Url.find_by_slug(params[:slug])
    if @url
      redirect_to @url.location
    else
      head 404
    end 
  end
end