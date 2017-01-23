class AttachmentsController < ApplicationController
  # skip_before_filter :verify_authenticity_token  #open when skip csrf token verify

  # attactments/

  def index
    @attachment = Attachment.new
  end

  def show
    @attachment = Attachment.find(1)
  end

  def upload
    @attachment = Attachment.new
    @attachment.picture = params[:file]
    @attachment.save

    respond_to do |format|
      format.json { render :json => { status: 'OK', link: @attachment.picture.url}}
    end
  end

  def create
    @attachment = Attachment.create(attachment_params)
    render :show
  end

  private
    def attachment_params
      params.require(:attachment).permit(:picture)
    end

end