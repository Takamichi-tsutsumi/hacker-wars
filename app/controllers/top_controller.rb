class TopController < ApplicationController

  def index
  	@photo = Photo.all
  	@photos = Photo.order('created_at DESC').where(created_at:Time.new(2014, 11, 28, 1, 1, 0, "+09:00")..(Time.now))
  	p @photo
  	p @photos
  	puts ("==================")
  end

  def category_change
  	p params[:season]
  	p params[:category_id]
	@photos = Photo.all.where(season: params[:season],category_id: params[:category_id])

	respond_to do |format|
		format.js {render :category_change}
	end
  end

  def season_change

	#受け取ったパラメーターはseasonに関して 0:all, 1:spring, 2:summer, 3:autum, 4:winter に対応
	@photos = @photos.where(season: params[:season])

  end

end
