class ContactMeController < ApplicationController

  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(params[:contact_message])
    if @contact_message.save
      redirect_to root_path, notice: "Thanks, we got your message"
    else
      flash.now.alert = "Looks like you've got problems..."
      render "new"
    end
  end
end