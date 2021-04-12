module Exercise
  module Arrays
    class << self
      def find_max(array)
        array.reduce { |max, el| el > max ? el : max }
      end

      def replace(array)
        max_elem = find_max(array)
        array.map { |el| el.positive? ? max_elem : el }
      end

      def iter_search(array, query, left, rigth)
        return -1 if left > rigth || left == array.length

        middle = (rigth - left) / 2 + left

        if array[middle] == query
          middle
        elsif array[middle] > query
          iter_search(array, query, 0, middle - 1)
        else
          iter_search(array, query, middle + 1, rigth)
        end
      end

      def search(array, query)
        return -1 if array.empty?

        iter_search(array, query, 0, array.length)
      end
    end
  end
end
