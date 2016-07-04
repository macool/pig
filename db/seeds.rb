u = Pig::User.create!(first_name: "Yoomee", last_name: "Developer", role: "admin",
                      active: true, email: "developers@yoomee.com", password: "password")
u.confirm
ct = Pig::ContentType.create!(name: "home", view_name: "homepage")
Pig::ContentPackage.create!(slug: "home", name: "home", content_type: ct,
                            editing_user: u, requested_by: u, next_review: Date.today,
                            due_date: Date.today,
                            position: 0, author: u, status: "draft", meta_title: "home",
                            json_content: {"content_chunks"=>{"title"=>{"value"=>"home page", "field_type"=>"string"}}})
Pig::ContentAttribute.create!(content_type: ct, slug: "title", name: "title",
                              field_type: "string", position: 0)

