require 'spec_helper'

describe ContactsController do

  let(:contact_double) { double(Contact) }
  let(:controller) { ContactsController.new }
  describe 'new' do
    it 'should create a new contact and assign it to a instance variable' do
      Contact.should_receive(:new).and_return(contact_double)
      controller.new
      controller.instance_variable_get(:@contact).should == contact_double
    end
  end

  describe 'index' do
    it 'should retrieve all contacts and create a new contact assigning them to two istance variables' do
      contacts_double = double(Array)
      Contact.should_receive(:new).and_return(contact_double)
      Contact.should_receive(:all).and_return(contacts_double)
      controller.should_receive(:get_request_parameter).with(:search).and_return(nil)
      controller.index
      controller.instance_variable_get(:@contact).should == contact_double
      controller.instance_variable_get(:@contacts).should == contacts_double
    end

    it 'should search by lastname if a search parameter is provided' do
      contacts_double = double(Array)
      Contact.should_receive(:new).and_return(contact_double)
      Contact.should_receive(:all).and_return(contacts_double)
      controller.should_receive(:search_contact_by_lastname)
      controller.should_receive(:get_request_parameter).with(:search).and_return('search')
      controller.index
    end
  end

  describe 'show' do
    it 'should find a contact by id and assign it to a variable' do
      id = 2
      controller.should_receive(:get_request_parameter).with(:id).and_return id
      Contact.should_receive(:find).with(id).and_return(contact_double)
      controller.show
      controller.instance_variable_get(:@contact).should == contact_double
    end
  end

  describe 'create' do
    it 'should create a new contact using a param and save it' do
      controller.should_receive(:get_request_parameter).with(:contact).and_return 'contact'
      Contact.should_receive(:new).with('contact').and_return(contact_double)
      contact_double.should_receive(:save)
      controller.create
      controller.instance_variable_get(:@contact).should == contact_double
    end
  end

  describe 'edit' do
    it 'should find a contact given an id an assign it to a variable' do
      controller.should_receive(:get_request_parameter).with(:id).and_return 'id'
      Contact.should_receive(:find).with('id').and_return(contact_double)
      controller.edit
      controller.instance_variable_get(:@contact).should == contact_double
    end
  end

  describe 'update' do
    it 'should search a contact by id and update it' do
      controller.should_receive(:get_request_parameter).with(:id).and_return 'id'
      controller.should_receive(:get_request_parameter).with(:contact).and_return 'contact'
      Contact.should_receive(:find).with('id').and_return(contact_double)
      contact_double.should_receive(:update_attributes).with('contact')
      controller.update
    end
  end

  describe 'destroy' do
    it 'should find a contact by id and destroy it' do
      controller.should_receive(:get_request_parameter).with(:id).and_return 'id'
      Contact.should_receive(:find).with('id').and_return(contact_double)
      contact_double.should_receive(:destroy)
      controller.destroy
    end
  end

end