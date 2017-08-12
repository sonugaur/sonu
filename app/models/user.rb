class User < ApplicationRecord
	validate :date_of_birth

  def date_of_birth
    if dob.present? && dob > Date.today
      errors.add(:dob, "not possible")
    end  



	validates :first_name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z_ ]+\z/,
               message: "only allows letters" }
	validates :last_name, length: { maximum: 50 }, format: { with: /\A[a-zA-Z_ ]+\z/,
               message: "only allows letters" }
	validates :email, presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: false }, format: { :with => /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "not in format" }
	validates :dob, presence: true
	validates :password, presence: true, length: { minimum: 8 }, confirmation: true
	validates :password_confirmation, presence: true, length: { minimum: 8 }
end