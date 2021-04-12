module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtred_films = array
                        .filter { |film| !(film['rating_kinopoisk'].nil? || film['rating_kinopoisk'].to_f.zero?) }
                        .filter { |film| !film['country'].nil? }
                        .filter { |film| film['country'].split(',').length >= 2 }

        filtred_films.reduce(0) { |acc, film| acc + film['rating_kinopoisk'].to_f } / filtred_films.length
      end

      def chars_count(films, threshold)
        filtred_films = films
                        .filter { |film| !film['rating_kinopoisk'].nil? }
                        .filter { |film| film['rating_kinopoisk'].to_f > threshold }
        filtred_films.reduce(0) { |acc, film| acc + film['name'].count('и') }
      end
    end
  end
end
