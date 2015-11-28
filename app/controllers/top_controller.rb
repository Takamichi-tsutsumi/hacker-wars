class TopController < ApplicationController

  def index
  	@photo = Photo.all
  	@photos = Photo.order('created_at DESC').where(created_at:Time.new(2014, 11, 28, 1, 1, 0, "+09:00")..(Time.now))
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
	if params[:id] == 0
		@photos = Photo.all
	else
		@photos = Photo.where(season: params[:season])
	end
	respond_to do |format|
		format.html { render :index }
	end

  end

  def my_page
  	@photos = User.find(current_user.id).photos
  	
  	season_category = []
  	for season in 1..4 do
  		for category_id in 2..4 do
  			season_category.push(@photos.where(season:season).where(category_id:category_id).count)
  		end
  	end
  	num = season_category.index(season_category.max)
  	case num
  	when 0 then
  		recommend = [1, 2]
  	when 1 then
  		recommend = [1, 3]
  	when 1 then
  		recommend = [1, 4]
  	when 0 then
  		recommend = [2, 2]
  	when 1 then
  		recommend = [2, 3]
  	when 1 then
  		recommend = [2, 4]
  	when 0 then
  		recommend = [3, 2]
  	when 1 then
  		recommend = [3, 3]
  	when 1 then
  		recommend = [3, 4]
  	when 0 then
  		recommend = [4, 2]
  	when 1 then
  		recommend = [4, 3]
  	when 1 then
  		recommend = [4, 4]
  	else
  		recommend = []
  	end

  	if !recommend.empty?
  		@recommend_photos = Photo.all.where(season: recommend[0], category_id:recommend[1]).reverse
  		if @recommend_photos.count < 3
  			@recommend_photos = Photo.order("created_at DESC")
  		end
  	end

  end

end
