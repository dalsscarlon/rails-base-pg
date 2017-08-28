class User < ApplicationRecord
  enum role: %i[customer agent consultant admin]
  after_initialize :set_default_role, :if => :new_record?

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  validates :username, uniqueness: { message: "El usuario ya fue utilizado, favor de especificar otro.", case_sensitive: false }, presence: { message: "Debe especificar el nombre de usuario, es con el que el usuario iniciará sesión." }
  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validates :first_name, presence: { message: "Debe especificar el nombre del usuario." }
  validates :last_name, presence: { message: "Debe especificar el apellido del usuario." }
  validates :email, uniqueness: { message: "El correo electrónico ya esta siendo usado, favor de especificar otro.", case_sensitive: false }, presence: { message: "Debe capturar el correo electrónico del usuario." }
  validates :password, presence: { message: "Debe especificar la contraseña nueva." },  length: { within: Devise.password_length, too_short: "La contraseña no puede ser menor a <%count%>s." }, confirmation: { message: "La contraseña no coincide." }

  def full_name
    "#{first_name} #{last_name}"
  end

  def email_changed?
    false
  end

  class << self
    def authenticate(login, password)
      user = User.find_for_database_authentication(login: login)
      user.try(:valid_password?, password) ? user : nil
      if user
        user.active_for_authentication? ? user : nil
      end
    end

    def find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      conditions[:email].downcase! if !!conditions[:email]

      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
      elsif conditions.key?(:username) || conditions.key?(:email)
        where(conditions.to_h).first
      end
    end
  end

  def set_default_role
    self.role ||= :consultant
  end

  def active_for_authentication?
    super && status?
  end
end
