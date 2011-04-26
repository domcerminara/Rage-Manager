class Host < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation

  attr_accessor :password
  before_save :prepare_password

  validates_presence_of :username, :first_name, :last_name
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  
  has_many :parties
  has_many :party_types, :through => :party
  has_many :locations
  has_many :guests
  has_many :invitaions, :through => :guest

  # login can be either username or email address
  def self.authenticate(login, pass)
    host = find_by_username(login) || find_by_email(login)
    return host if host && host.password_hash == host.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end
  
  def name
    first_name + " " + last_name
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end
