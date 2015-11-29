class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])
    photos = @organization.photos
    @images = {}
    Category.all.each do |category|
    	@images[category.name.to_s] = photos.where(category_id: category.id).first unless category.name.to_s == 'site'
    	@images[category.name.to_s] = photos.where(category_id: category.id).second if category.name.to_s == 'site'
    end
  end
end
