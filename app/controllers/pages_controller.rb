require 'date'
class PagesController < ApplicationController


  def search
    check_in = params[:query][:start_date]
    check_out = params[:query][:end_date]
    room_date_search = <<-SQL
        SELECT
        *
        FROM rooms
        JOIN availabilities ON rooms.id = availabilities.room_id
        JOIN room_requests ON availabilities.room_id = room_requests.room_id
        WHERE room_requests.status = 'APPROVED' AND #{check_in} >= availabilities.start_date AND #{check_out} <= availabilities.end_date AND #{check_in} > room_requests.end_date AND #{check_out} < room_requests.start_date
    SQL
    region = params[:query][:region]
    page = params[:page] ? params[:page] : 1

    r = Room.joins(:room_requests).where('room_requests.status = ?','APPROVED')

    @final_results = Room.where(address_region: region)
    .joins(:availabilities)
    .where(':check_in >= availabilities.start_date AND :check_out <= availabilities.end_date', check_in: check_in, check_out: check_out )

    f = Room.all
    # fail
    # .page(page).per(6)

    #.joins("LEFT OUTER JOIN room_requests ON rooms.id = room_requests.room_id")
    #.where("room_requests.status = 'APPROVED' ")
    #.where(":check_out > room_requests.end_date AND room_requests.start_date > :check_in", check_in: check_in, check_out: check_out )
    @rooms = @final_results


    # i think i would need a left outer join (or some other join to still include tables that didn't have any approved requests)

    # fail

    # @users = User.includes(:posts).page(params[:page])

    render :search_results
  end

  # do i even need pgsearch?
  # @final_results = Room.search_by_region(params[:query][:region])


  # @final_results = Room.where(room_date_search, check_in: check_in, check_out: check_out)
  # @final_results = Room.find_by_sql(room_date_search)


  #room_date_search = <<-SQL
  #     SELECT
  #     *
  #     FROM rooms
  #     JOIN availabilities ON rooms.id = availabilities.room_id
  #     JOIN room_requests ON availabilities.room_id = room_requests.room_id
  #     WHERE room_requests.status = 'APPROVED' AND :check_in >= availabilities.start_date AND :check_out <= availabilities.end_date AND :check_in > room_requests.end_date AND :check_out < room_requests.start_date
  # SQL

end
