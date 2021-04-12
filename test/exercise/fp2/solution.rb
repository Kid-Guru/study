module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&blk)
        return if empty?

        first, *rest = self
        yield first
        MyArray.new(rest).my_each(&blk)
        self
      end

      # Написать свою функцию my_map
      def my_map
        new_array = []
        my_each { |el| new_array << (yield el) }
        MyArray.new(new_array)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = my_reduce([]) { |acc, el| el.nil? ? acc : acc << el }
        MyArray.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = 'no_argument_passed')
        acc = init == 'no_argument_passed' ? self[0] : init
        rest = init == 'no_argument_passed' ? drop(1) : self

        rest.my_each { |el| acc = yield acc, el }
        acc
      end
    end
  end
end
