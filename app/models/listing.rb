class Listing < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :orders

    def thumbnail 
        return self.image.variant(resize: "100x100")
    end

    def medium
        return self.image.variant(resize: "200x200")
    end

    # validates data fields 
    validates :name, :description, :price, :image, presence: true
    validates :price, numericality: {greater_than: 0 }

    belongs_to :user
end

def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:image, 'must be a JPEG or PNG.')
    elsif image.attached? == false
        errors.add(:image, 'must have an image attached')
    end
end
