FactoryGirl.define do
  factory :user, :class => User do
    sequence(:username) {|n| "admin#{n}"}
    password "secret"
    locale "en"

    factory :invalid_user do
      username nil
    end
  end

  factory :post, :class => Post do
    title "something for title"
    body "something for body"

    factory :invalid_post do
      title nil
    end
  end

  factory :comment, :class => Comment do
    body "something for body"

    factory :invalid_comment do
      body nil
    end
  end
end