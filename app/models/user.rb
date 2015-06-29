class User < ActiveRecord::Base
  
  # Cria um atributo virtual
  attr_accessor :password
  
  # Não cria caso o atributo virtual não tenha sido preenchido
  validates_confirmation_of :password
  
  # Roda a encriptação antes de salvar
  before_save :encrypt_password
  
  # Função para encriptar a senha
  def encrypt_password
	 self.password_salt = BCrypt::Engine.generate_salt
	 self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
