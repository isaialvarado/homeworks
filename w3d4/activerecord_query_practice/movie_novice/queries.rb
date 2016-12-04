# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer


def find_angelina
  #find Angelina Jolie by name in the actors table
  Actor.find_by_name('Angelina Jolie')
end

def top_titles
  # get movie titles from movies with scores greater than or equal to 9
  # hint: use 'select' and 'where'
  Movie.select('id, title').where(['score >= :num', { num: 9 }])
end

def star_wars
  #display the id, title and year of each Star Wars movie in movies.
  # hint: use 'select' and 'where'
  Movie
    .select('id, title, yr')
    .where(['title LIKE :movie', { movie: '%Star Wars%' }])
end


def below_average_years
  #display each year with movies scoring under 5,
  #with the count of movies scoring under 5 aliased as bad_movies,
  #in descending order
  # hint: use 'select', 'where', 'group', 'order'
  Movie
    .select('yr, COUNT(*) AS bad_movies')
    .where(['score < :num', { num: 5 }])
    .group('yr')
    .order('bad_movies DESC')
end

def alphabetized_actors
  # display the first 10 actor names ordered from A-Z
  # hint: use 'order' and 'limit'
  Actor
    .order('name')
    .limit(10)
end

def pulp_fiction_actors
  # practice using joins
  # display the id and name of all actors in the movie Pulp Fiction
  # hint: use 'select', 'joins', 'where'
  Actor
    .select('actors.id, actors.name')
    .joins(:movies)
    .where(['movies.title = :movie', { movie: 'Pulp Fiction'}])
    .distinct
end

def uma_movies
  #practice using joins
  # display the id, title, and year of movies Uma Thurman has acted in
  # order them by ascending year
  # hint: use 'select', 'joins', 'where', and 'order'
  Movie
    .select('movies.id, movies.title, movies.yr')
    .joins(:actors)
    .where(['actors.name = :actor', { actor: 'Uma Thurman' }])
    .order('movies.yr ASC')
end