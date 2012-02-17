class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  protect_from_forgery

  def redirect_with_flash(resource, path=nil, message=nil)
    path = resource unless path
    resource = resource[1] if resource.is_a?(Array)
    message = flash_message(resource) unless message
    redirect_to path, :notice => message
  end

  private

  def flash_message(resource)
    translated_resource = t('activerecord.models.' + resource.class.name.downcase).classify
    @flash_message = t("flash.#{self.action_name}", :resource => translated_resource)
  end
end
