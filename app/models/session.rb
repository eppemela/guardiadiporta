class Session < ActiveRecord::Base
  belongs_to :station

  scope :open, -> { where(open: true) }
  scope :closed, -> { where(open: false) }

  def self.get(station_id)
    where(station_id: station_id, open: true)
  end


  def self.find_or_create(station_id, start_time)
    attributes_for_creation = {
      station_id: station_id,
      start: start_time,
      open: true
    }

    if (get(station_id).empty?)
      create(attributes_for_creation)
    end
  end

end
