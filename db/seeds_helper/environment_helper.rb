require_relative 'seeds_constants'

module EnvironmentHelper
  @@forum_categories = SeedsConstants::FORUM_CATEGORIES
  @@cities = SeedsConstants::CITIES_ARRAY
  @@calendar_ids = SeedsConstants::CALENDAR_ID
  @@photo_keys = SeedsConstants::PHOTO_KEYS
  @@city_index = 0

  def gen_jerry
    user = SeedsHelper.jerry_user
    6.times do
      city = create_city
      gen_location_city_content(city, user)
    end
  end

  def gen_model_1 # Cities with many users
    3.times do
      print '###############'
      city = create_city
      6.times do
        user = SeedsHelper.gen_user
        gen_location_city_content(city, user)
      end
    end
  end

  def gen_model_2 # Users with many cities
    4.times do
      print '###############'
      user = SeedsHelper.gen_user
      3.times do
        city = create_city
        gen_location_city_content(city, user)
      end
    end
  end

  private

  def self.create_city
    city = SeedsHelper.gen_city(@@cities, @@city_index, @@calendar_ids, @@photo_keys)
    @@city_index += 1
    city
  end

  def self.gen_location_city_content(city, user)
    location = Location.create!(user_id: user.id, city_id: city.id)

    @@forum_categories.each do |category|
      SeedsHelper.gen_city_environment(category, city, user)
    end
  end
end