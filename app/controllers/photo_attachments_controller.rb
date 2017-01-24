class Photo_AttachmentsController < ApplicationController
  # skip_before_filter :verify_authenticity_token  #open when skip csrf token verify

  # attactments/

  def index
    @photo_attachment = photo_Attachment.new
  end
  
  def show
    @photo_attachment = photo_Attachment.find(1)
  end
  
  def upload
    @photo_attachment = photo_Attachment.new
    @photo_attachment.picture = params[:file]
    @photo_attachment.save
    
    respond_to do |format|
        format.json { render :json => { status: 'OK', link: @photo_attachment.picture.url}}
    end
  end
  
  def create
    @photo_attachment = photo_Attachment.create(photo_attachment_params)
    render :show
  end
  
  private
    def photo_attachment_params
      params.require(:photo_attachment).permit(:picture)
    end

end