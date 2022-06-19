class ApplicationController < ActionController::Base

  def after_sign_out_path_for(resource)
  if resource == :admin
        admin_root_path
  else
       root_path
  end
  end



  protected

end
