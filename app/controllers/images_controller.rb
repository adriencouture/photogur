class ImagesController < ApplicationController

def index
  @images = Image.all
end

def new
  @image = Image.new
end

def show
  @image = Image.find(params[:id])
end

def create
  image = Image.new(image_params)

  if image.save

    redirect_to images_path
  else

  end
end

def edit
  @image = Image.find(params[:id])
end

def update
  @image = Image.find(params[:id])
  if @image.update_attributes(image_params)
    redirect_to image_url(@image)
    # redirect_to "/images/#{@image.id}"
  else
    render :edit
  end
end

def destroy
  @image = Image.find(params[:id])
  @image.destroy
  redirect_to images_url
end

private
def image_params
  params.require(:image).permit(:title, :artist, :url)
end


end
