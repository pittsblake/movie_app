FavoriteMovie.destroy_all
User.destroy_all
Movie.destroy_all

users = []
movies = []

5.times do
    users << User.create(
        email: FFaker::Internet.email,
        password: 'blahblah',
        password_confirmation: 'blahblah'
    )
end

movies << Movie.create(
    api_id: 'tt0083658'
)

movies << Movie.create(
    api_id: 'tt0076759'
)

movies << Movie.create(
    api_id: 'tt0080684'
)

movies << Movie.create(
    api_id: 'tt0086190'
)

movies << Movie.create(
    api_id: 'tt0119081'
)

users.each do |user|
  movies.each do |movie|
    FavoriteMovie.create(
        user_id: user.id,
        movie_id: movie.id
    )
  end
end