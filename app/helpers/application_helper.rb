module ApplicationHelper
  def get_photo_key(object)
    if object && object.photo.attachment.present?
      photo_key = object.photo.key
    else
      photo_key = "https://res.cloudinary.com/ducqpxfso/image/upload/v1614857823/no-img-profile_og8ezm.jpg" #no photo image on cloudinary
    end 
 end

 def get_photo_key_city(object)
    if object.photo.attachment.present?
      photo_key = object.photo.key
    else
      photo_key = cl_image_path "q086ozr6xng829m1a5y0fcnv1wqs" #no photo image on cloudinary
    end 
 end
end
