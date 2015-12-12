class Citizen < ActiveRecord::Base
	has_many :citizen_bank_data
	has_many :transactions
	attr_accessible :name,:phone_num,:email,:address,:national_id
	


	validates :name, presence: true
	validates :national_id, uniqueness: :true, presence: true, format: {:with => /^[A-Z]{3}\d{10}$/, multiline: true, message: "must have 3 capital letters and 10 digits following"}


  def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    citizen = find_by_id(row["id"]) || new
    citizen.attributes = row.to_hash.slice(*accessible_attributes)
    citizen.save!
    end
  end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::Csv.new(file.path)
	  when ".xls" then Roo::Excel.new(file.path)
	  when ".xlsx" then Roo::Excelx.new(file.path)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end


end
