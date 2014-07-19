class Member < ActiveRecord::Base

  has_and_belongs_to_many :teches
  has_many :rates
  has_many :rated_members, through: :rates, class_name: "Member", foreign_key: :rated_member_id # The members this member has rated
  has_many :rated_by_members, through: :rates, class_name: "Member", foreign_key: :rater_member_id # The members that have rated this client  
  before_save { self.email = email.downcase }

  
  validates :username, presence: true, length: { maximum:50}
  validates :password, presence: true, length: { maximum:50}
  validates :name, presence: true, length: { maximum:50}
  validates :lastname, presence: true, length: { maximum:50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX }, 
  					uniqueness: { case_sensitive: false }
  has_secure_password

  validates :password, length: { minimum: 4 }

  def image_file=(incoming_file)
    self.filename = incoming_file.original_filename
       # self.image_file = incoming_file.original_filename

    #self.content_type =incoming_file.content_type.chomp
    #self.data =incoming_file.read

     # give the file path for image
     directory ="public/upload_images"
     file_path = File.join(directory,self.filename)
    # copy the image from the uploaded one to file_path
     #File.open(file_path,'w+b') {|f| f.write(self.data)}
     File.open(file_path,'w+b') {|f| f.write(incoming_file.read)}
  end

  def Member.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Member.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    self.password='1234'
    self.password_confirmation='1234'
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Member.exists?(column => self[column])
  end
  private

    def create_remember_token
      self.remember_token = Member.digest(Member.new_remember_token)
    end



end
