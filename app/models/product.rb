class Product < ActiveRecord::Base
	searchkick

	geocoded_by :place
	after_validation :geocode

	acts_as_followable

	belongs_to :user
	has_attached_file :image, styles: { medium: "400x400#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end