module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self
          yield el
        end
      end

      # Написать свою функцию my_map
      def my_map
        new_array = []
        my_each { |el| new_array << (yield el) }
        MyArray.new(new_array)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = my_reduce([]) do |acc, el|
          if el.nil?
            acc
          else
            acc << el
          end
        end
        MyArray.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = 'no_argument_passed')
        first_iteration = true

        my_each do |el|
          if first_iteration
            first_iteration = false
            if acc == 'no_argument_passed'
              acc = self[0]
              next
            end
          end

          acc = yield acc, el
        end
        acc
      end
    end
  end
end
