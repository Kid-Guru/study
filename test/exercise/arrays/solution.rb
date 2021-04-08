module Exercise
  module Arrays
    class << self
      def _find_max(array)
        array.reduce { |max, el| el > max ? el : max }
      end

      def replace(array)
        max_elem = _find_max(array)
        array.map { |el| el.positive? ? max_elem : el }
      end

      def _iter_search(array, query, left, rigth)
        return -1 if left > rigth || left == array.length

        middle = (rigth - left) / 2 + left

        if array[middle] == query
          middle
        elsif array[middle] > query
          _iter_search(array, query, 0, middle - 1)
        else
          _iter_search(array, query, middle + 1, rigth)
        end
      end

      def search(array, query)
        return -1 if array.empty?

        _iter_search(array, query, 0, array.length)
      end
    end
  end
end
