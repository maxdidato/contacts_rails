class ContactsController < ApplicationController
  respond_to :js,:html
  def index
    @contacts = Contact.all
    search = get_request_parameter(:search)
    @contacts = search_contact_by_lastname(search) if search
    @contact = Contact.new
  end

  def get_request_parameter name
    params[name]
  end

  def search_contact_by_lastname lastname
    @contacts.find_all { |c| c.last_name.downcase.include?(lastname.downcase) }
  end

  def show
    @contact = Contact.find(get_request_parameter(:id))
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(get_request_parameter(:id))
  end

  def create
    @contact = Contact.new(get_request_parameter(:contact))
    @contact.save
  end

  def update
    @contact = Contact.find(get_request_parameter(:id))
    @contact.update_attributes(get_request_parameter(:contact))
  end

  def destroy
    @contact = Contact.find(get_request_parameter(:id))
    @contact.destroy
  end
end
