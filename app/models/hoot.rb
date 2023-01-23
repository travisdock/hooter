class Hoot < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  def body_with_links
    # find all @user mentions
    users = body.scan(/@(\w+)/)
    users.map!{ |username| User.find_by(username: username) }.compact!
    # for each user, replace the @user with a link to the user's profile
    users.each do |user|
      body.gsub!(/@#{user.username}/, "<a href='/users/#{user.id}'>@#{user.username}</a>")
    end
    # return the hoot with the @user mentions replaced with links
    body.html_safe
  end
end
