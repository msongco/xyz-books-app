class Isbn < ApplicationRecord
  def self.is_isbn_13_valid?(isbn)
    # Each digit, from left to right, is alternately multiplied by 1 or 3, then those products are summed modulo 10 to give a value ranging from 0 to 9.
    # Subtracted from 10, that leaves a result from 1 to 10. A zero replaces a ten, so, in all cases, a single check digit results.
    check_digit = isbn[-1]

    i = 0
    sum = 0

    while i < isbn.length - 1
      sum += (i % 2 * 2 + 1) * isbn[i].to_i # (i % 2 * 2 + 1) - the number to be multiplied : it's either 1 or 3 (integer weight)
      i += 1
    end

    diff_checker = 10 - (sum % 10)

    if diff_checker == 10
      check_digit = "0"
    end

    diff_checker.to_s == check_digit
  end

  def self.is_isbn_10_valid?(isbn)
    # Each of the first nine digits of the 10-digit ISBN – excluding the check digit itself – is multiplied by its (integer) weight,
    # descending from 10 to 2, and the sum of these nine products found.
    # The value of the check digit is simply the one number between 0 and 10 which, when added to this sum, means the total is a multiple of 11.
    check_digit = isbn[-1]
    isbn = isbn.chop.reverse! # removes the last character, then reverses the characters

    i = 0
    sum = 0

    while i < isbn.length
      sum += (i + 2) * isbn[i].to_i
      i += 1
    end

    if check_digit.upcase == "X"
      check_digit = 10
    end

    (sum + check_digit.to_i) % 11 == 0
  end

  # A 10-digit ISBN is converted to a 13-digit ISBN by prepending "978" to the ISBN-10 and recalculating the final checksum digit using the ISBN-13 algorithm.
  # The reverse process can also be performed, but not for numbers commencing with a prefix other than 978, which have no 10-digit equivalent.
  def self.convert_isbn(isbn)
    clean_isbn = isbn.gsub("-","")

    if clean_isbn.size == 13 && clean_isbn.start_with?("978") # convert from isbn 13 to isbn 10
      if is_isbn_13_valid?(clean_isbn)
        clean_isbn = clean_isbn[3..-1]
        clean_isbn = clean_isbn.chop.reverse!

        i = 0
        sum = 0

        while i < clean_isbn.length
          sum += (i + 2) * clean_isbn[i].to_i
          i += 1
        end

        check_digit = 11 - (sum % 11)

        if check_digit == 10
          check_digit = "X"
        elsif check_digit == 11
          check_digit = "0"
        end

        converted_isbn = clean_isbn.reverse! + check_digit.to_s
        converted_isbn = converted_isbn[0] + "-" + converted_isbn[1,3] + "-" + converted_isbn[4,5] + "-" + converted_isbn[-1]

        { isbn_10: converted_isbn }
      end

    elsif clean_isbn.size == 10 # convert from isbn 10 to isbn 13
      if is_isbn_10_valid?(clean_isbn)
        clean_isbn = "978" + clean_isbn

        i = 0
        sum = 0

        while i < clean_isbn.length - 1
          sum += (i % 2 * 2 + 1) * clean_isbn[i].to_i # (i % 2 * 2 + 1) - the number to be multiplied : it's either 1 or 3 (integer weight)
          i += 1
        end

        check_digit = 10 - (sum % 10)

        if clean_isbn == 10
          check_digit = "0"
        end

        converted_isbn = clean_isbn.chop + check_digit.to_s
        converted_isbn = converted_isbn[0,3] + "-" + converted_isbn[3] + "-" + converted_isbn[4,6] + "-" + converted_isbn[10,2] + "-" + converted_isbn[-1]

        { isbn_13: converted_isbn }
      end
    end
  end
end
