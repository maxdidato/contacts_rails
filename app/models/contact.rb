class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :landline, :last_name, :mobile, :photo, :twitter
  has_attached_file :photo, :styles => {:medium => "100x100>"}

  validates_presence_of :first_name, :last_name, :email, :mobile
  validates :email, :format => {:with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
  validates :mobile, numericality: {only_integer: true}
  validates :landline, allow_blank: true, numericality: {only_integer: true}
  validates :twitter, allow_blank: true, :format => {:with => /^[A-Za-z0-9_]{1,15}$/}
  validates :first_name, :last_name, format: {with: /^[a-z ,.'-]+$/i,
                                              message: "only allows letters"}

  def error_messages
    self.errors.full_messages.inject("") { |str, msg| str << "<li>#{msg}</li>" }
  end
end
