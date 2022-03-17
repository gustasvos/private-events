class AttendancesController < ApplicationController
    def create
        # @attendance = current_admin.attendances.build(attendances_params)
        @attendance = Attendance.new(attendances_params)
        @attendance.admin_id = current_admin.id
        if @attendance.save
            format.html do
            redirect_to event_path(@attendance.event_id), notice: 'Attendance was successfully confirmed.'
            end
        else
            format.html { render :show, status: :unprocessable_entity }
        end
    end

    private
    def attendances_params
        params.require(:attendance).permit(:event_id)
    end
end
