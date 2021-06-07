def is_prime?(n)
    return false if n < 2

    (2...n).none? { |factor| n % factor == 0 }
end

def nth_prime(n)
    prime_count = 0
    current = 0
    while prime_count < n
        current += 1
        prime_count += 1 if is_prime?(current)
    end

    current
end

def prime_range(min, max)
    (min..max).select { |num| is_prime?(num) }
end