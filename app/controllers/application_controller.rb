class ApplicationController < ActionController::Base

  def after_sign_out_path_for(resource)
  if resource == :admin
        admin_root_path
  else
       root_path
  end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
    admin_orders_path
    when Customer
    products_path
    end
  end


  protected

end
