class PropObserver < ActiveRecord::Observer
  def after_create(prop)
    if !prop.receiver.notification_preferences.empty?(:name => 'prop_received')
      if Rails.env.production?
        UserMailer.delay.prop_received(prop)
      else
        UserMailer.prop_received(prop).deliver
      end
    end
  end
end
