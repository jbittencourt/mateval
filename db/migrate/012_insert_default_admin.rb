class InsertDefaultAdmin < ActiveRecord::Migration
	def self.up
	
		admin = User.new()
		admin.id = 1
		admin.name = "admin"
		admin.username = "admin"
		#admin.password = "admin"
		admin.salt = "d232f8318231183367314adebe4947885eda284b"
		admin.crypted_password = "b2c89cfa771230ac60443c37dabecebd83c05e96"
		admin.save
	
	end
end
