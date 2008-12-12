class ContactsController < ApplicationController

  def index
    @contacts = Contact.view(database_name, 'contacts/by_last_name-map')
    respond_to do |format|
      format.pdf do
        pdf = PdfLabelMaker.avery_labels(@contacts.rows)
        send_data pdf.render, :filename => 'labels.pdf', :type => 'application/pdf'
      end
      format.html
    end
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
