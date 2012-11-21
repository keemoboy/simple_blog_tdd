Fabricator(:comment) do
  body { Faker::Lorem.sentence }
end

Fabricator(:comment_with_article, :from => :comment) do
  article
end