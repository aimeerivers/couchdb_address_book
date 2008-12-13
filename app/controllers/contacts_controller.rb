class ContactsController < ApplicationController

    require 'pdf/writer'
    include PDF
    
  def index
    @contacts = Contact.view(database_name, 'contacts/by_last_name-map')
    respond_to do |format|
      format.pdf do
        options = {
          :columns => 3,
          :labels_per_page => 30,
          :left_margin => Writer.mm2pts(4),
          :bottom_margin => Writer.mm2pts(25),
          :label_width => Writer.mm2pts(67),
          :label_height => Writer.mm2pts(26.3),
          :label_padding_x => Writer.mm2pts(4),
          :label_padding_y => Writer.mm2pts(3),
          :gap_between_labels_x => Writer.mm2pts(4),
          :font_size =>  9,
          :line_height =>  10
        }
        pdf = PdfLabelMaker.avery_labels(@contacts.rows, 'user-defined', options)
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
