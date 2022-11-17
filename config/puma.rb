# frozen_string_literal: true

min_threads_count = ENV.fetch('MAX_THREAD', 5)
max_threads_count = ENV.fetch('MIN_THREAD', 5)
threads min_threads_count, max_threads_count
