class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
  def edit
    @photo = Photo.find(params[:id])
  end
  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = "Photo was created successfully"
    else
      flash[:error] = "Photo was not created"
    end
    redirect_to user_photo_path(current_user, @photo)
  end
  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Album was updated successfully"
    else
      flash[:error] = "Album was not updateed"
    end
    redirect_to user_photo_path(current_user,@photo)
  end
  def show
    @photo = Photo.find(params[:id])
    @comment = @photo.comments.build
  end
  def destroy
    debugger
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:notice] = "Photo was removed successfully"
    else
      flash[:error] = "Photo could not be deleted"
    end
    redirect_to user_path (current_user)
  end

end
