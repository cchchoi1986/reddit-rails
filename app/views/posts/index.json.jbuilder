json.posts @posts do |post|
  json.title post.title
  json.url post.url
  json.created_at post.created_at
  json.link url_for(post_path(post))
  json.author_email post.user.email
end