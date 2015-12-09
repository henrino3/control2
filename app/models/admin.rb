class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :password, :format => {:with =>/(?=^.{8,}$)(?=.*\d)(?=.*[!@#$%^&*\.\\]+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/ ,multiline: true, message: "	Must have at least 1 capital letter,\n 1 alphanumeric character \n and 1 symbol"}


end
