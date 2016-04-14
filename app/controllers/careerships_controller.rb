class CareershipsController < ApplicationController
  before_action :logged_in_user

  def create
    if params[:name]
      @job = Job.find_or_initialize_by(asin: params[:name])
    else
      @job = Job.find(params[:name])
    end

    # jobsテーブルに存在しない場合はすくレーピングのデータのを登録する
    if @job.new_record?
      begin

      rescue Error => e
        return render :js => "alert('#{e.message}')"
      end

    end

    if params[:type] == "Hope"
      current_user.hope(@job)
    elsif params[:type] == "Graduate"
      current_user.graduate(@job)
    end
  end

  def destroy
    @job = Job.find(params[:title])
    if params[:type] == "Hope"
      current_user.unhope(@job)
    elsif params[:type] == "Graduate"
      current_user.ungraduate(@job)
    end
    
  end
end
