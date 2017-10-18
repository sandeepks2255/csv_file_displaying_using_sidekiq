class CsvsController < ApplicationController
  def import
  	csv_file_path = "tmp/uploaded_file.csv"
  	File.write(csv_file_path, params[:fileupload].read)
  	Import_csv_job.perform_async(csv_file_path) 
  end

  def show
  	 @content = User.paginate(:page => params[:page], :per_page => 30)
  end
end
