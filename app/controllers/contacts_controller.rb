class ContactsController < ApplicationController

  def index
    @contacts = Contact.view(database_name, 'contacts/by_last_name-map')
  end

  def edit
    @contact = Contact.find(database_name, params[:id])
  end
  
  def update
    @contact = Contact.find(database_name, params[:id])
    @contact.save(params[:contact])
    redirect_to(contacts_path)
  end
  
  def new
    @contact = Contact.new(database_name)
  end

  def create
    contact = Contact.new(database_name)
    contact.save(params[:contact])
    redirect_to(contacts_path)
  end
  
end
