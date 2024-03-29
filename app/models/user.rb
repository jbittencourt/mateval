require 'digest/sha1'
class User < ActiveRecord::Base
  has_many :plannings
  has_many :objectives
  
  has_many :diario_de_classe_posts
  has_and_belongs_to_many :classrooms

  has_many :subscriptions
  has_many :subjects, :through => :subscriptions
  
  has_and_belongs_to_many :roles
  
  # a trick to get the user stored in the session
  cattr_accessor :current_user
  
  # Virtual attribute for the unencrypted password
  attr_accessor :password

  validates_presence_of     :username, :email
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :username,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :username, :email, :case_sensitive => false
  before_save :encrypt_password

  # Authenticates a user by their username name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_username(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    self.remember_token_expires_at = 2.weeks.from_now.utc
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

#------------------------------------------------------------------------------------------------------------------------------

   # list_classrooms
	# Retorna uma lista com as turmas atrelhadas ao professor, recebendo como parâmetro o ano das turmas a serem listadas.
	# Caso o usuário não passe nenhum parâmetro, é inferido que o ano corresponde ao ano atual.

	def list_classrooms(year = Date.today.to_s[0,4])
		
		self.classrooms.find(:all, :conditions => "year = '#{year}'")

	end
	
#------------------------------------------------------------------------------------------------------------------------------

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{username}--") if new_record?
      self.crypted_password = encrypt(password)
    end
    
    def password_required?
      crypted_password.blank? || !password.blank?
    end
end
