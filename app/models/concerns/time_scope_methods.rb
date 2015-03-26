module TimeScopeMethods
  extend ActiveSupport::Concern 

  included do
    field :time, type: Time
    attr_accessor :year, :month, :mday
    validates :time, presence: true

    before_validation(on: :create) do
      begin
        if !year.blank? && !month.blank? && !mday.blank?
          self.time = Time.new(year, month, mday, 0, 0, 0, "+08:00")
        end
      rescue
        self.time = nil
      end
    end

    # 举例 2015年4月1日
    # by_time(2015,4,1)
    scope :by_year_month_day, ->(year, month, day) {
      start_time = Time.new(year, month, day, 0, 0, 0, "+08:00")
      end_time   = start_time + 1.day - 1.seconds
      where(
        :time.gte => start_time, 
        :time.lte => end_time
      )
    }

    scope :by_time, ->(time){
      t = time.localtime("+08:00")
      by_year_month_day(t.year, t.month, t.mday)
    }
  end
end