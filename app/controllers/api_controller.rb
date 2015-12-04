class ApiController < ApplicationController

  def photo_data
    if params[:season] && params[:category] != "0"
      @photos = Photo.where(season: params[:season]).where(category_id: params[:category])
    elsif params[:season] && params[:category] == "0"
      @photos = Photo.where(season: params[:season])
    end
    render 'photo_data'
  end
end