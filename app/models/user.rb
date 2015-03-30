class User < ActiveRecord::Base
  include ActiveModel::Validations

  delegate :can?, :cannot?, :to => :ability
  
  validates_uniqueness_of :email, :allow_blank => true, :if => :email_changed?, :message => 'This e-mail address is already taken'
  validates_format_of     :email, :with  => /\A[^@]+@[^@]+\z/, :allow_blank => true, :if => :email_changed?, :message => 'You must specify a valid e-mail address'
  validates               :email, :presence => { message: 'You must specify an e-mail address' }

  validates_presence_of     :password, :if => :password_required?, :message => 'You must specify a password'
  validates_confirmation_of :password, :if => :password_required?, :message => 'Your passwords do not match'
  validates_length_of       :password, :within => 6..128, :allow_blank => true, :message => 'The password must be more than 6 characters'

  validates :name, :presence => { message: 'You must have a name' }
  validates_acceptance_of :terms_of_service, :on => :create, :message => 'Terms of Use must be accepted'

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :admin_of, :class_name => "Org", :join_table => "orgs_admins", :uniq => true
  has_many :user_affiliations
  has_many :affiliates, :through => :user_affiliations

  has_attached_file :avatar, :storage => :s3, :s3_credentials => {
      access_key_id: ENV['AWS_ACCESS_KEY'],
      secret_access_key: ENV['AWS_SECRET_KEY'],
      bucket: ENV['AWS_BUCKET']
    }, :path => ':attachment/:id/:style.:extension',
    :styles => { thumb: ['32x32', :png], profile: ['128x128', :png]},
    :default_url => '/assets/default_user_:style.png'

  has_and_belongs_to_many :followers, :class_name => 'User', :join_table => 'users_followers', :foreign_key => 'user_id', :association_foreign_key => 'follower_id', :uniq => true
  has_and_belongs_to_many :following, :class_name => 'User', :join_table => 'users_followers', :foreign_key => 'follower_id', :association_foreign_key => 'user_id', :uniq => true

  has_many :participations
  has_many :events_participated, :through => :participations, :source => :event

  has_many :user_notifications
  has_many :notification_preferences, :through => :user_notifications, :source => :notification
  belongs_to :neighborhood

  attr_accessor :account_type
  attr_accessor :terms_of_service
  attr_accessor :signup_reason

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :terms_of_service, :name, :email, :password, :password_confirmation, :remember_me, :avatar, :birthday, :neighborhood_id, :skill_ids, :account_type, :hours_volunteered, :notification_preference_ids, :description, :signup_reason, :confirmed_at


  scope :in_neighborhood, lambda { |neighborhood|
    includes(:neighborhood).where('neighborhood_id = ?', neighborhood.id)
  }

  def ability
    @ability ||= Ability.new(self)
  end

  def score
    participations.sum(&:hours_volunteered)*(0.3*participations.count)*(0.7*Event.includes(:user).created_by(self).count)
  end

  def hours_volunteered(event=nil)
    if event != nil
      Participation.where('user_id = ? AND event_id = ?', self.id, event.id).sum(:hours_volunteered)
    else
      Participation.where('user_id = ?', self.id).sum(:hours_volunteered)
    end
  end

  def created_events_count
    Event.created_by(self).count
  end

  def upcoming_events_count
    Event.involving(self).upcoming.count
  end

  def past_events_count
    Event.involving(self).past.count
  end

  # Comma-delimited string of skills, for the mobile API
  def categories
    skills.map{|s| s.id }.join(',')
  end

  def props
    Prop.received_by(self).count
  end

  def team
    following.map{|s| s.id }.join(',')
  end

  def avatar_url
    if avatar.file?
      avatar.url(:profile)
    else
      nil
    end
  end

  def role?(role)
    !!self.roles.find_by_name(role.to_s.camelize)
  end

  def is_moderator?
    affiliates.where('moderator = true').any?
  end

  def moderator_of?(affiliate)
    affiliation = user_affiliations.find_by_affiliate_id(affiliate.id)

    affiliation.moderator if affiliation
  end

  def should_show_wizard?
    false
  end

  def password_match?
    self.errors[:password] << 'password not match' if password != password_confirmation
    self.errors[:password] << 'you must provide a password' if password.blank?
    password == password_confirmation and !password.blank?
  end

  def create_associated_org(org_email, org_name)
    org = Org.new(:email => org_email, :password => Devise.friendly_token[0,20], :name =>org_name)
    org.admins << self
    org.save
  end

  def self.find_for_oauth(json_info)
    data = json_info
    Rails.logger.info("JSON Token Information")
    Rails.logger.info(json_info.inspect)
    user = User.where(:email => data.email).first
    unless user
      user = User.create!(:email => data.email, :password => Devise.friendly_token[0,20], :name => data.name)
      user.confirm!
    end
    user
  end

  def password_required?
    if password.to_s.empty? && password_confirmation.to_s.empty?
      false
    else
      true
    end
  end

  def self.xml(entity)
    entity.to_xml(:methods => [:hours_volunteered, :created_events_count, :upcoming_events_count, :past_events_count, :categories, :props, :avatar_url, :team])
  end
  def self.json(entity)
    entity.to_json(:methods => [:hours_volunteered, :created_events_count, :upcoming_events_count, :past_events_count, :categories, :props, :avatar_url, :team])
  end
end
