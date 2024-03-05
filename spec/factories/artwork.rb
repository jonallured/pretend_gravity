FactoryBot.define do
  factory :artwork do
    amount_cents { 77_000 }
    artist_name { "Polly Painter" }
    medium { "Very wet paint" }
    title { "Just like some flowers or whatever" }
  end
end
