class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper
  
  def fully_symbolize(item)
    if item.kind_of?(Hash)
      item.inject({}) {|result, (k,v)|
        key = k.kind_of?(String) ? k.to_sym : k
        value = v.kind_of?(Hash) ? symbolize_hash(v) : (v.kind_of?(String) ? v.to_sym : v)
        result[key] = value
        result
      }
    else
      item = item.to_sym if item.kind_of?(String)
      item
    end
  end
end
