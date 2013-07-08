class ContactsController < ApplicationController
  respond_to :js,:html
  def index
    @contacts = Contact.all
    @contacts = search_contact_by_lastname(params[:search]) if params[:search]
    @contact = Contact.new
  end

  def search_contact_by_lastname lastname
    @contacts.find_all { |c| c.last_name.downcase.include?(lastname.downcase) }
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.save
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update_attributes(params[:contact])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
  end
end
