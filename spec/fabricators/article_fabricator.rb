Fabricator(:article) do
  title { Faker::Lorem.sentence }
  body  { Faker::Lorem.paragraphs(3).join("\n") }
end

Fabricator(:article_with_comments, from: :article) do
  comments(:count=>3)
end