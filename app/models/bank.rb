class Bank < ActiveRecord::Base
	before_create {self.token = SecureRandom.hex}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :transactions

	has_many :citizen_bank_data

	validates :name, presence: true
	validates :bank_type, presence: true
	validates :registration_no, presence: true, format: {:with => /^\d{9}?$/,multiline: true, message: "must contain 9 digits"}  
	validates :bank_website, presence: true
end
