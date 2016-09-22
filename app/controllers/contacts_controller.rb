class ContactsController < ApplicationController
  def show
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Gracias por contactarnos. Pronto atenderemos tu mensaje!'
      redirect_to contacts_url
    else
      flash[:error] = 'Mensaje no pudo ser enviado'
      render :show
    end
  end
end